import express from 'express';

const router = express.Router();

import connection from '../connection';

router.get('/obtener-orden', async (req, res) =>{

    try{
        const query = 'SELECT * FROM orden';
        const mesas = await connection.query(query);
        res.json(mesas);



    } catch(error){
        return res.json({error});  
    }

});

module.exports = router;