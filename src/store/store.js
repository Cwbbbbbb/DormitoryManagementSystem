import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)


export default new Vuex.Store({
     state: {
        loginid:"",
        password:"",
        dor:"",
        role:"",
    },
    getters:{
        getloginid(state){
            sessionStorage.getItem("loginid")
            return state.loginid
        },
        getpassword(state){
            sessionStorage.getItem("password")
            return state.password
        },
        getdor(state){
            sessionStorage.getItem("dor")
            return state.dor
        },
        getrole(state){
            sessionStorage.getItem("role")
            return state.role
        },
    },
    mutations:{
        changloginid(state,i){
            sessionStorage.setItem("loginid",i)
            state.loginid=i;
        },
        changpassword(state,i){
            sessionStorage.setItem("password",i)
            state.password=i;
        },
        changdor(state,d){
            sessionStorage.setItem("dor",d)
            state.dor=d;
        },
        changrole(state,r){
            sessionStorage.setItem("role",r)
            state.role=r;
        },
    },
  })