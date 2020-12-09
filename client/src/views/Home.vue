
<template>

  <div>
    <v-container>
      <center>
    <v-img
      :height="250"
      :width="250"
      src="../assets/logoed.jpg"
    ></v-img>
    </center>
  </v-container>
    <template>
      <v-toolbar color="primary" flat>
        <v-btn color = "primary" @click="NC_modal = true">Nueva Comida</v-btn>
      </v-toolbar>
    </template>
 

  <v-container>
    <v-data-table
    :headers="headers"
    :items="comidas_bebidas"
    :items-per-page="5"
    class="elevation-1"
    >
    <template v-slot:item.Actions = "{item}">
      <v-icon @click="borrar_alimentos(item)">
        fas fa-trash
      </v-icon>
      <v-icon @click="AC_modal = true; get_item(item)">
       fas fa-pencil-alt
      </v-icon>
    </template>
    </v-data-table>

<v-dialog
  v-model="AC_modal"
  persistent :overlay="false"
  max-width="500px"
  transition="dialog-transition"
>
  <v-card>
    <v-card-title>
      Actualizar Datos
    </v-card-title>
   <template>
    <v-form>
       <v-container>
        <v-row>
          <v-col
            cols="12"
            md="4"
          >
            <v-text-field
              v-model="actualizar_alimentos.CXM_Nombre"
              label="Alimento"
              required
            ></v-text-field>
          </v-col>

          <v-col
            cols="12"
            md="4"
          >
            <v-text-field
              v-model="actualizar_alimentos.CXM_Categoria"
              label="Tipo de Comida"
              required
            ></v-text-field>
          </v-col>

          <v-col
            cols="12"
            md="4"
          >
            <v-text-field
              v-model="actualizar_alimentos.CXM_Precio"
              label="Precio"
              type = 'Number'
              required
            ></v-text-field>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </template>
  </v-card>
  <v-btn color = "success" @click="update_alimento(actualizar_alimentos.CXM_ID.CXM_ID2)">Agregar</v-btn>
  <v-btn color = "error" @click="cancelar_update()">Cancelar</v-btn>
</v-dialog>


    <v-dialog
      v-model="NC_modal"
      max-width="500px"
      persistent :overlay="false"
      transition="dialog-transition"
    >
      <v-card>
        <v-card-title>
          Nueva Comida
        </v-card-title>
  <template>
    <v-form>
       <v-container>
        <v-row>
          <v-col
            cols="12"
            md="4"
          >
            <v-text-field
              v-model="nuevo_alimento.CXM_Nombre"
              label="Alimento"
              required
            ></v-text-field>
          </v-col>

          <v-col
            cols="12"
            md="4"
          >
            <v-text-field
              v-model="nuevo_alimento.CXM_Categoria"
              label="Tipo de Comida"
              required
            ></v-text-field>
          </v-col>

          <v-col
            cols="12"
            md="4"
          >
            <v-text-field
              v-model="nuevo_alimento.CXM_Precio"
              label="Precio"
              type = 'Number'
              required
            ></v-text-field>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </template>
      </v-card>
      <v-btn color = "success" @click="guardar()">Agregar</v-btn>
      <v-btn color = "error" @click="cancelar()">Cancelar</v-btn>
    </v-dialog>

  </v-container>

  </div>
  
</template>

<script>
  export default {
    name: 'Home',
    data () {
      return {
        headers: [
          { text: 'COMIDA ID', value: 'CXM_ID'},
          {
            text: 'Comida o bebida',
            align: 'start',
            sortable: true,
            value: 'CXM_Nombre',
          },
          { text: 'Categoria', sortable: true, value: 'CXM_Categoria' },
          { text: 'Precios', value: 'CXM_Precio' },
          {text: 'Acciones', value: 'Actions'}
        ],
          comidas_bebidas: [],

          NC_modal:false,
          AC_modal:false,

          nuevo_alimento:{
            CXM_Nombre: '',
            CXM_Categoria: '',
            CXM_Precio: ''
          },

          actualizar_alimentos:{
            CXM_ID: '',
            CXM_Nombre: '',
            CXM_Categoria: '',
            CXM_Precio: ''
          },

      }
    },

    created(){
      this.llenar_alimentos();
    },

    methods: {
      async llenar_alimentos(){
        const api_data = await this.axios.get('/comidaxbebida/obtener-comidaxbebida');
        this.comidas_bebidas = api_data.data;
      },

      async borrar_alimentos(item){
        const body = {
          CXM_ID: item.CXM_ID
        }
        await this.axios.post('/comidaxbebida/eliminar-comidaxbebida', body);

        this.llenar_alimentos();
      },

      cancelar(){
        this.nuevo_alimento = {};
        this.NC_modal = false;
      },
      async guardar(){
        await this.axios.post('/comidaxbebida/agregar-comidaxbebida', this.nuevo_alimento);
        this.llenar_alimentos();
        this.cancelar();
      },

      cancelar_update(){
        this.actualizar_alimentos = {};
        this.AC_modal = false;
      },
      async update_alimento(item){
        const body = {CXM_ID: item.CXM_ID};
        await this.axios.post('/comidaxbebida/modificar_comidaxbebida', this.actualizar_alimentos);
        this.llenar_alimentos();
        this.cancelar_update();
      },

      get_item(item){
         const body = {
          CXM_ID2: item.CXM_ID
        }
        this.actualizar_alimentos.CXM_ID = body 
      },

    },

  }
</script>
