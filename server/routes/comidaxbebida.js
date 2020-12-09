import express, { response } from 'express';

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

router.post('/eliminar-comidaxbebida', async (req, res) =>{
    try {
        const body = req.body;
        const query =  `DELETE FROM comidaxbebidas where CXM_ID = ${body.CXM_ID}`;
        await connection.query(query);
        res.json('ok');

    } catch (error) {
        return res.json({error});
    }
 });


router.post('/agregar-comidaxbebida', async (req, res) =>{
    try {
        const body = req.body;
        const query =  `INSERT INTO comidaxbebidas(CXM_Nombre, CXM_Categoria, CXM_Precio) VALUES ('${body.CXM_Nombre}', '${body.CXM_Categoria}', ${body.CXM_Precio})`;
        await connection.query(query);
        res.json('ok');

    } catch (error) {
        return res.json({error});
    }

    
});

router.post('/modificar_comidaxbebida', async (req, res) => {
try {
    const body = req.body;
    const query = `UPDATE comidaxbebidas SET CXM_Nombre = '${body.CXM_Nombre}', CXM_Categoria = '${body.CXM_Categoria}', CXM_Precio = ${body.CXM_Precio}  WHERE CXM_ID = ${body.CXM_ID.CXM_ID2}`;
    await connection.query(query);
    res.json('ok');
    
} catch (error) {
    return res.json({error});
}
   

});

module.exports = router;