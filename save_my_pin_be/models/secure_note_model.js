const { default: mongoose } = require("mongoose");

const Schema = mongoose.Schema;

const SecureNote = mongoose.model('SecureNote',{
  noteName : String,
  body : String,
  hasOptCode : Boolean,
  optPassCode : String,
  user : {
      type : Schema.Types.ObjectId,
      ref : "User",
      required : false
  }
});

module.exports = mongoose.model("SecureNote", SecureNote)