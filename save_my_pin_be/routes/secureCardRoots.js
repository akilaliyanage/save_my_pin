const express = require("express");
const app = express();
const User = require("../models/User");
const Card = require("../models/Card");
const router = require("express").Router();
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

//Add Card
router.post("/add-card", async (req, res) => {

    try{
      const isCardExisting = await Card.findOne({ cardNumber: req.body.cardNumber });
    
      if (isCardExisting) {
        res.json({ status: 401, message: "card already exist" });
      } else {

        const user = await User.findById(req.body.userId);

        if(user){

            const {
                cardNumber = cardNumber,
                expiryDate = expiryDate,
                cardHolderName = cardHolderName,
                cvvCode = cvvCode,
                cardType = cardType,
                pinNo = pinNo,
                owner = user,
            } = req.body
        
            const card = await new Card({
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                cardType: cardType,
                pinNo: pinNo,
                owner: owner
            });

            try{
                await card.save()
                .then(data => {
                    res.json({ status: 201, message: "Card added successfully" });
                });
            }
            catch(error){
                console.log("Error in creating card : " + error );
                res.json({ status: 401, message: error });
            }
        
        }
        else{
            console.log("Use Not fount");
            res.json({ status: 500, message: error });
        }
      }

    }
    catch(error){
        console.log(error);
    }

    
    });

//Get cards of user
router.get("/get-cards/:userId", async (req, res) => {
    try {
  
      let userId = req.params.userId;
  
      const cards = await Card.find({
        owner: userId,
      });
  
        res.json(cards);
  
    } catch (err) {
      res.json({ error: err });
    }
  });

module.exports = router;