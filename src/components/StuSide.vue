<template>
    <el-menu
      default-active="1"
      class="el-menu-vertical-demo"
      background-color="#545c64"
      text-color="#fff">
      <el-menu-item v-for="i in items" :key="i.id" :index="i.id" @click="to(i.id)">{{i.info}}</el-menu-item>
    </el-menu>
</template>
<script>
export default {
  name:"StuSide",
  data(){
    return{
      items:[
        {
          id:'1',
          info:'首页',
        },
        {
          id:'2',
          info:'宿舍信息',
        },
        {
          id:'3',
          info:'学生信息',
        },
        {
          id:'4',
          info:'宿舍管理员信息',
        },
        {
          id:'5',
          info:'个人信息',
        },
      ]
    }
  },
  methods:{
    to(i){
      switch(i){
        case '1':this.$router.replace({path:'/Student'});break;
        case '2':this.$router.replace({path:'/DInfo'});break;
        case '3':this.$router.replace({path:'/SInfo'});break;
        case '4':this.$router.replace({path:'/Dad'});break;
        case '5':this.$router.replace({name:'student',path:'/UInfo'});break;
        default:break;
      }
    }
  }
}
</script>
<style scoped>
.el-menu-vertical-demo{min-height: 100vh;}
</style>