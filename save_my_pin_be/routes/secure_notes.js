const express = require('express');
const req = require('express/lib/request');
const app = express()

const router = express.Router({});

//models
const SecureNote = require('../models/secure_note_model')


router.get('/get-all', async (_req, res, _next) => {
	try{
        var allItems = await SecureNote.find({})

        if(allItems){
            res.status(200).send(allItems)
        }
    }catch (err){
        res.status(500).send(err.toString())
    }


});

router.patch('/update/:id',async (req, res, _next)=>{
    try{
        var body = req.body.data;
        var id = req.params.id;

        var isUpdated = await SecureNote.findOneAndUpdate({_id: id},{body : body})

        if(isUpdated){
            res.status(200).json({"message":"updated"})
        }
    }catch (err){
        res.status(500).send(err.toString())
    }
})

router.get('/get/:id', async (_req, res, _next) => {
    try{
        var item = await SecureNote.findOne({noteName: req.params.id})

        if(item){
            res.status(200).send(item)
        }
    }catch (err){
        res.status(500).send(err.toString())
    }


});

router.post('/create-new', async (req, res, _next) => {
	try{
        var noteName = req.body.noteName;
        var body = req.body.body;
        var newSecureNote = new SecureNote({
            noteName : req.body.noteName,
            body : req.body.body,
            hasOptCode : req.body.hasOptCode ?? false,
            optPassCode : req.body.hasOptCode ? req.body.optPassCode : null,
        })

        newSecureNote.save().then(data =>{
            cartId = data._id;
            console.log(cartId);
            res.status(200).json({
                "message" : "saved successfully"
            })
        }).catch(err =>{
            res.status(500).json({
                "message": err.toString()
            })
            console.log(err);
        })
    }catch(e){

    }
});

router.delete('/delete/:id', async (req, res, _next) => {
    try{
        var onbId = req.params.id

        let isDeleted = await SecureNote.deleteOne({_id: onbId})

        if(isDeleted){
            console.log(isDeleted);
            res.status(200).json({"message" : "item deleted"})
        }
    }catch (err){
        res.status(500).send(err.toString())
    }
})

router.get('/search/:name',async (req, res, _next) => {
    try {
        var name = req.params.name
        let results = await SecureNote.find({"noteName": name})

        if(results){
            res.status(200).send(results)
        }
    } catch (err) {
        res.status(500).send(err.toString())
    }
})

// export router with all routes included
module.exports = router;