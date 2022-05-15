import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const routes=[
  {
    path:'/',redirect:"/Login"
  },
  {
    path:'/Login',name:'登录',
    component:()=>import("@/views/Login"),
  },
  
  //学生端
  {
    path:'/Student',name:'学生端',
    component:()=>import("@/pages/StuIndex"),
    children:[
      {
        path:'',component:()=>import("@/views/Home"),
      },
      {
        path:'/SInfo',component:()=>import("@/views/student/SInfo"),
      },
      {
        path:'/DAd',component:()=>import("@/views/student/DAdminInfo"),
      },
      {
        path:'/DInfo',component:()=>import("@/views/student/DInfo"),
      },
      {
        path:'/UInfo',name:'student',component:()=>import("@/views/UserInfo"),
      },
    ]
  },
  {
    path:'/DAdmin',name:'宿管端',
    component:()=>import("@/pages/DIndex"),
    children:[
      {
        path:'',component:()=>import("@/views/Home"),
      },
      {
        path:'/Schedule',component:()=>import("@/views/Doradmin/Schedule"),
      },
      {
        path:'/DManage',component:()=>import("@/views/Doradmin/DManage"),
      },
      {
        path:'/FInfo',component:()=>import("@/views/Doradmin/FInfo"),
      },
      {
        path:'/Public',component:()=>import("@/views/Doradmin/Public"),
      },
      {
        path:'/UInfo',name:'dadmin',component:()=>import("@/views/UserInfo"),
      },
    ]
  },

]
const router=new Router({
  routes,
  mode:"history"
})

export default router