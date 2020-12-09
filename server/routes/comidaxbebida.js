import express from 'express';

const router = express.Router();

import connection from '../connection';

router.get('/obtener-comidaxbebida', async (req, res) =>{

    try{
        const query = 'SELECT * FROM comidaxbebidas';
        const cxb = await connection.query(query);
        res.json(cxb);

    } catch(error){
        return res.json({error}); 
    }

});

module.exports = router;