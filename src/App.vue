<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<style>
  #app {
    background-color: #F2F6FC;
    width: 100%;
    height: 100%;
    overflow: hidden;
  }
  body{
    margin: 0;
    padding: 0;
  }
</style>
<script>
export default {
      created(){      //在页面加载时读取Storage里的状态信息      
   	 sessionStorage.getItem("loginid") && this.$store.replaceState(Object.assign(this.$store.state,JSON.parse(sessionStorage.getItem("loginid"))));            
	
	//在页面刷新时将vuex里的信息保存到Storage里      
	window.addEventListener("beforeunload",()=>{          
		sessionStorage.setItem("loginid",JSON.stringify(this.$store.state))
	})     
   }
}
</script>