import express from 'express';

const router = express.Router();

import connection from '../connection';

router.get('/obtener-orden', async (req, res) =>{

    try{
        const query = 'SELECT * FROM orden';
        const orden = await connection.query(query);
        res.json(orden);


    } catch(error){
        return res.json({error}); 
    }

});

module.exports = router;