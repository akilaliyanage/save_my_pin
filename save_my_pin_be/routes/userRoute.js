const express = require("express");
const app = express();
const User = require("../models/User");
const Group = require("../models/Group");
const router = require("express").Router();
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");


//Account Registration
router.post("/register", async (req, res) => {

  const isExisting = await User.findOne({ email: req.body.email });
  let admin = null;
  
    if (isExisting) {
      res.json({ status: 401, message: "user already exist" });
    } else {
  
      let username = req.body.username;
      let email = req.body.email;
      let access_code = req.body.access_code;
      let password = req.body.password;
      let user_type = "accountManager";
  
      const salt = await bcrypt.genSalt();
      const hashedPassword = await bcrypt.hash(password, salt);
      const hashedAccessCode =  await bcrypt.hash(access_code, salt);
  
      const user = await new User({
        username: username,
        email: email,
        accessCode: hashedAccessCode,
        password: hashedPassword,
        userType: user_type,
      });
  
      await user.save().then(user => {
        admin = user;
      });

      const group = new Group({
          admin:  admin,
        });
      group.save().then(data => {
          res.json({ status: 201, message: "New Account created" });
      });

    }
  });

  //Add new member
router.post("/add_member", async (req, res) => {

    const group = await Group.findOne({ 
        admin: req.body.admin,
    });

    const accessCode =  req.body.access_code;

  const members = await User.find({
    group: group._id,
  });

  let groupMember  = await isMemberExisting(members, accessCode);

    if (groupMember) {
      res.json({ status: 401, message: "member already exist" });
    } else {
      let username = req.body.username;
      let access_code = req.body.access_code;
      let user_type = "member";
  
      const salt = await bcrypt.genSalt();
      const hashedAccessCode =  await bcrypt.hash(access_code, salt);
  
      const member = await new User({
        username: username,
        accessCode: hashedAccessCode,
        userType: user_type,
        group: group._id,
      });
  
      member.save().then(data => {
        res.json({ status: 201, message: "New member added" });
      });
    }
  });

  //User Login
router.post("/login", async (req, res) => {
    try {
      let email = req.body.email;
      let password = req.body.password;
  
      const user = await User.findOne({ email: email });
  
      if (user) {
        const auth = await bcrypt.compare(password, user.password);
        if (auth) {
          const accessToken = jwt.sign(
            { user },
            process.env.ACCESS_TOKEN_SECRET_KEY,
            {
              expiresIn: "1h",
            }
          );
          res.json({ status: 200, token: accessToken, user: user });
        } else {
          res.json({ status: 401, message: "unauthorized" });
        }
      } else {
        res.json({ status: 404, message: "user does not exist." });
      }
    } catch (err) {
      res.json({ error: err });
    }
  });
    //Provide access
router.post("/access", async (req, res) => {
  try {

    let accessCode = req.body.access_code;
    let group = req.body.group;
  
    const members = await User.find({
      group: group, 
    });

    let groupMember  = await isMemberExisting(members, accessCode);

      if (groupMember) {
        res.json({ status: 200, user: groupMember });
      } else {
        res.json({ status: 401, message: "unauthorized" });
      }
   
  } catch (err) {
    res.json({ error: err });
  }
});

//Get group members
router.get("/group/:id", async (req, res) => {
  try {

    let group = req.params.id;

    const members = await User.find({
      group: group,
    });

      res.json({ status: 200, members: members });

  } catch (err) {
    res.json({ error: err });
  }
});

//remove group member
router.delete("/remove_member/:id", async (req, res) => {
  try {
    await User.findOneAndDelete(req.params.id).then(() => {
      res.json({ status: 200, message: "Member Removed" });
    })
  } catch (err) {
    res.json({ error: err });
  }
});


//Update User Profile
router.put("/update/:id", async (req, res) => {
  try{
    const userID = req.params.id;
    let updateUser;

    let username = req.body.username;

    updateUser = {
      username: username,
    };

    await User.findByIdAndUpdate(userID, updateUser).then((user) => {
      res.json({ status: 200, message: "user updated", user: user });
    });
  }
  catch(e){
    res.json({ status: 200, error: e });
  }
});

//update password
router.put("/update_password/:id", async (req, res) => {

  try{

    const userID = req.params.id;
    let updateUser;

    let user = await User.findOne({_id: userID});
    const auth = await bcrypt.compare(req.body.old_password, user.password);

    if(auth){
      let password = req.body.new_password;

      const salt = await bcrypt.genSalt();
      const hash = await bcrypt.hash(password, salt);

      updateUser = {
        password: hash,
      };
    }
    else{
      res.json({ status: 401, error: "Password does not match" });
    }

    await User.findByIdAndUpdate(userID, updateUser).then((user) => {
      res.json({ status: 200, message: "password updated", user: user });
    });
  }
  catch(e){
    res.json({ status: 200, error: e });
  }
});

//update password
router.put("/update_access/:id", async (req, res) => {

  try{

    const userID = req.params.id;
    let updateUser;

    let user = await User.findOne({_id: userID});
    const auth = await bcrypt.compare(req.body.old_access_code, user.accessCode);

    if(auth){
      let accessCode = req.body.new_access_code;

      const salt = await bcrypt.genSalt();
      const hash = await bcrypt.hash(password, salt);

      updateUser = {
        accessCode: hash,
      };
    }
    else{
      res.json({ status: 401, error: "Access code does not match" });
    }

    await User.findByIdAndUpdate(userID, updateUser).then((user) => {
      res.json({ status: 200, message: "Access Code updated", user: user });
    });
  }
  catch(e){
    res.json({ status: 200, error: e });
  }

});




async function isMemberExisting(members, accessCode) {
  for( let member of members) {
    const auth =  await bcrypt.compare(accessCode, member.accessCode);
    if (auth === true) {
      return member;
    }
  }
}

module.exports = router;