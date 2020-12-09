<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      
        <v-btn color= "dark">meseros</v-btn>
         <v-spacer></v-spacer>
        <v-btn color= "dark">ordenes</v-btn>  

          <v-spacer></v-spacer>

      <v-btn color= "dark">alimentos</v-btn>

    </v-app-bar>
     


    <v-main>
      <router-view> </router-view>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'App',

  components: {
   
  },

  data: () => ({
    
  }),
};

</script>
