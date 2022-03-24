const express = require('express');
const req = require('express/lib/request');
const app = express()

const router = express.Router({});

//models
const SecureNote = require('../models/secure_note_model')


router.get('/get-all', async (_req, res, _next) => {
	
});

router.post('/create-new', async (_req, res, _next) => {
	try{

        var newSecureNote = new SecureNote({
            noteName : _req.body.noteName ?? "",
            body : _req.body.body ?? "",
            hasOptCode : _req.body.hasOptCode ?? false,
            optPassCode : _req.body.hasOptCode ? _req.body.optPassCode : null,
        })

        newSecureNote
    }catch(e){

    }
});

// export router with all routes included
module.exports = router;