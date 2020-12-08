import express from 'express';

const router = express.Router();

import connection from '../connection';

router.get('/obtener-meseros', async (req, res) =>{

    try{
        const query = 'SELECT * FROM meseros';
        const meseros = await connection.query(query);
        res.json(meseros);

    } catch(error){
        return res.json({error}); 
    }

});

module.exports = router;