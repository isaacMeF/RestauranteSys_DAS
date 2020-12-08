const express = require('express');
const app = express();
const path = require('path');
const history = require('connect-history-api-fallback')
const cors = require('cors');
const morgan = require('morgan');

app.use(morgan('tiny'));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(express.static(path.join(__dirname, 'public')));
app.use(history());

app.use('/meseros', require('./routes/meseros'));



app.listen(3000, function(){
    console.log('Server arriba');
});