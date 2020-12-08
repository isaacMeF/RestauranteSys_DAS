import express from 'express';

const router = express.Router();

import connection from '../connection';

router.get('/obtener-ordenspec', async (req, res) =>{

    try{
        const query = 'SELECT * FROM ordenespec';
        const ordenspec = await connection.query(query);
        res.json(ordenspec);


    } catch(error){
        return res.json({error}); 
    }

});

module.exports = router;