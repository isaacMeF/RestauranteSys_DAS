import express from 'express';

const router = express.Router();

import connection from '../connection';

router.get('/obtener-mesas', async (req, res) =>{

    try{
        const query = 'SELECT * FROM mesa';
        const mesas = await connection.query(query);
        res.json(mesas);
        console.log('ok');



    } catch(error){
        return res.json({error});  
    }

});

module.exports = router;