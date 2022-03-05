const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const groupSchema = new Schema({

    admin: {
        type: Schema.Types.ObjectId, ref: 'User',
        required: true,
    }

})

const Group = mongoose.model("Group", groupSchema);
module.exports = Group;