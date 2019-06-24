<template>
	<div>

	
   
     	<transition name="component-fade" mode="out-in">
        <router-view></router-view>
      </transition>
    
	</div>


</template>


<script>

export default {
  

    
    // created(){
    //   this.$store.dispatch('setAuth', (window.authUser));
    //   if(this.authInfo){
    //     this.getNotificationCount();
    //     setInterval(()=>{
    //       this.getNotificationCount()
    //     },5000)
    //   }
      
     
      
    // },


}
</script>

<style>

</style>




