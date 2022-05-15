<template>
  <el-card>
    <div class="public">
      <el-form
        ref="publicform"
        :model="form"
        label-width="80px"
        :rules="publicrules"
      >
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title"></el-input>
        </el-form-item>
        <el-form-item label="发布人" prop="publisher">
          <el-input v-model="form.publisher"></el-input>
        </el-form-item>
        <el-form-item label="简介" prop="info">
          <el-input type="textarea" v-model="form.info"></el-input>
        </el-form-item>
        <el-form-item label="发布时间" prop="date">
          <el-date-picker
            placeholder="选择时间"
            type="datetime"
            v-model="form.date"
            value-format="yyyy-MM-dd HH:mm:ss"
            style="width: 200px; float: left"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="内容" prop="show">
          <el-input type="textarea" v-model="form.show" rows="10"></el-input>
        </el-form-item>
        <el-button @click="resetform()">清空</el-button>
        <el-button type="primary" @click="publish()">发布</el-button>
      </el-form>
    </div>
  </el-card>
</template>
<script>
import { mapGetters, mapState } from "vuex";
import axios from "axios";
export default {
  data() {
    return {
      form: {
        info: "",
        title: "",
        publisher: "",
        date: "",
        show: "",
      },
      publicrules: {
        date: [{ required: true, message: "请选择日期", trigger: "blur" }],
        info: [{ required: true, message: "请输入简介", trigger: "blur" }],
        title: [{ required: true, message: "请输入标题", trigger: "blur" }],
        publisher: [
          { required: true, message: "请输入发布者", trigger: "blur" },
        ],
        show: [{ required: true, message: "请输入内容", trigger: "blur" }],
      },
    };
  },
  methods: {
    publish() {
      this.$refs["publicform"].validate((valid) => {
        if (valid) {
          axios
            .post("http://localhost:3000/api/publish", { form: this.form })
            .then((response) => {
              alert("发布成功");
              console.log(this.form);
            })
            .catch((error) => {
              console.log("error:" + error);
            });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetform() {
      this.$refs.publicform.resetFields();
    },
  },
};
</script>
<style scoped>
.public {
  width: 600px;
  margin: 0 auto;
  text-align: center;
}
</style>