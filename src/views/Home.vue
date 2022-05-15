<template>
  <div>
    <el-card>
      <div class="logo">
        <img src="../assets/images/imgs/logo.png" alt="logo" />
        <h1>办一所对学生最负责任的大学</h1>
      </div>
      <!-- 轮播图 -->
      <el-carousel height="300px" type="card" :interval="2000">
        <el-carousel-item>
          <img src="../assets/images/imgs/1.png" alt />
        </el-carousel-item>
        <el-carousel-item>
          <img src="../assets/images/imgs/2.png" alt />
        </el-carousel-item>
        <el-carousel-item>
          <img src="../assets/images/imgs/3.png" alt />
        </el-carousel-item>
        <el-carousel-item>
          <img src="../assets/images/imgs/4.png" alt />
        </el-carousel-item>
        <el-carousel-item>
          <img src="../assets/images/imgs/5.png" alt />
        </el-carousel-item>
        <el-carousel-item>
          <img src="../assets/images/imgs/6.png" alt />
        </el-carousel-item>
      </el-carousel>
      <h2 class="welcome">欢迎您！使用仲恺农业工程学院宿舍管理系统</h2>
    </el-card>
    <el-card>
      <el-tabs v-model="activeName">
        <el-tab-pane label="公告" name="first" >
          <ul>
            <li v-for="i in items" :key="i.pid" :index="i.pid" @click="show(i.title,i.content)">{{i.info}}
            <span>{{i.publisher}} {{i.pdate}}</span></li>
          </ul>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import axios from 'axios';
export default {
  data() {
    return {
      activeName:'first',
      items:[{
        pid:'',
        info:'',
        title:'',
        publisher:'',
        pdate:'',
        content:''
      }]
    };
  },
  methods: {
    show(a,b){
      this.$alert(b,a,{dangerouslyUseHTMLString: true,});
    }
  },
   created() {
    axios
      .post("http://localhost:3000/api/public")
      .then((response) => {
        this.items = response.data;
        console.log(this.items)
      })
      .catch((error) => {
        console.log("error:" + error);
      });
  },
};
</script>

<style lang="css" scoped>
.el-carousel__item img {
  height: 100%;
  width: 100%;
}
.welcome {
  text-align: center;
  margin: 40px 0px;
}
.logo {
  height: 60px;
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  text-align: center;
}
.logo img {
  height: 100%;
}
.logo h1 {
  display: inline-block;
  margin-left: 140px;
}
.el-card{
min-height: 80vh;
}
ul li{
  color: blue;
  cursor: pointer;
}
ul li:hover{
  color: red;
  cursor: pointer;
}
span{
  float: right;
}
</style>