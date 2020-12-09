
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
 
 

  <v-container>
    <v-data-table
    :headers="headers"
    :items="comidas_bebidas"
    :items-per-page="5"
    class="elevation-1"
    ></v-data-table>
  </v-container>
  </div>
  
</template>

<script>
  export default {
    name: 'Home',
    data () {
      return {
        headers: [
          {
            text: 'Comida o bebida',
            align: 'start',
            sortable: false,
            value: 'CXM_Nombre',
          },
          { text: 'Categoria', value: 'CXM_Categoria' },
          { text: 'Precios', value: 'CXM_Precio' },
        ],
          comidas_bebidas: [],
      }
    },

    created(){
      this.llenar_alimentos();
    },

    methods: {
      async llenar_alimentos(){
        const api_data = await this.axios.get('/comidaxbebida/obtener-comidaxbebida');
        this.comidas_bebidas = api_data.data;
      }
    },

  }
</script>
