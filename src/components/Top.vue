<template>
    <el-card id="top">
        <h2>学生宿舍管理系统</h2>
        <h3>欢迎您，{{student}}</h3>
    </el-card>
</template>
<script>
import {mapGetters, mapState} from "vuex";
export default {
    computed:{
        ...mapState({
            student:state=>state.loginid
        }),
        ...mapGetters([
            'getloginid'
        ])
    }
}
</script>
<style scoped>
#top{width: 100%;height: 100px;margin: 0 auto;text-align: center;}
h2{margin: 0px;}
</style>