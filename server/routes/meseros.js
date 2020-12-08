import express from 'express';

const router = express.Router();

import connection from '../connection';

router.get('/obtener-meseros', async (req, res) =>{

    try{
        const query = 'SELECT * FROM meseros';
        const mesas = await connection.query(query);
        res.json(mesas);



    } catch(error){
        return res.json({error});  
    }

});

module.exports = router;