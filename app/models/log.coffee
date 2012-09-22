# The Log model

mongoose = require('mongoose')
Schema = mongoose.Schema
ObjectId = Schema.ObjectId;

logSchema = new Schema({
    date: {type: Date, default: Date.now},
    level: {type: String, default: 'info'},
    message: String
});

module.exports = mongoose.model('Log', logSchema);