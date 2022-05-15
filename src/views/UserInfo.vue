<template>
  <div>
    <el-card>
      <div class="users">
        <el-image
          shape="square"
          :src="require('@/assets/images/avatar/' + userinfo.img)"
          style="width: 100px; height: 100px"
        ></el-image>
        <div class="info">
          <el-descriptions class="margin-top" title="个人信息" :column="5">
            <el-descriptions-item label="姓名">{{
              userinfo.name
            }}</el-descriptions-item>
            <el-descriptions-item label="学号" v-if="this.role == 'student'">{{
              userinfo.sid
            }}</el-descriptions-item>
            <el-descriptions-item label="职工号" v-if="this.role == 'admin'">{{
              userinfo.aid
            }}</el-descriptions-item>
            <el-descriptions-item label="性别">{{
              userinfo.gender
            }}</el-descriptions-item>
            <el-descriptions-item label="宿舍号">{{
              userinfo.dor
            }}</el-descriptions-item>
            <el-descriptions-item label="手机号">{{
              userinfo.phone
            }}</el-descriptions-item>
          </el-descriptions>
          <el-button size="medium" @click="dialogFormVisible1 = true"
            >修改密码</el-button
          >
          <el-dialog title="修改密码" :visible.sync="dialogFormVisible1">
            <el-form :model="form" :rules="passwordrule" ref="pass">
              <el-form-item
                label="原密码"
                :label-width="formLabelWidth"
                prop="prepass"
              >
                <el-input v-model="form.prepass" autocomplete="off"></el-input>
              </el-form-item>
              <el-form-item
                label="新密码"
                :label-width="formLabelWidth"
                prop="newpass"
              >
                <el-input v-model="form.newpass" autocomplete="off"></el-input>
              </el-form-item>
              <el-form-item
                label="确认密码"
                :label-width="formLabelWidth"
                prop="confirmpass"
              >
                <el-input
                  v-model="form.confirmpass"
                  autocomplete="off"
                ></el-input>
              </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
              <el-button @click="handleclose('pass')">取 消</el-button>
              <el-button type="primary" @click="confirm()">确 定</el-button>
            </div>
          </el-dialog>
          <el-button size="medium" @click="dialogFormVisible2 = true"
            >修改信息</el-button
          >
          <el-dialog title="修改信息" :visible.sync="dialogFormVisible2">
            <el-form :model="form2" :rules="inforule" ref="info">
              <el-form-item label="头像" :label-width="formLabelWidth">
                <el-upload
                  action="http://localhost:3000/api/avatar_upload"
                  name="image"
                  :data="userinfo"
                  ref="upload"
                  enctype="multipart/form-data"
                  list-type="picture-card"
                  :on-preview="handlePictureCardPreview"
                  :on-remove="handleRemove"
                  :on-success="successUpload"
                  :on-change="beforeUpload"
                  :auto-upload="false"
                  :limit="1"
                >
                  <i class="el-icon-plus"></i>
                </el-upload>
                <el-dialog :visible.sync="dialogVisible">
                  <img width="100%" :src="dialogImageUrl" alt="" />
                </el-dialog>
              </el-form-item>
              <el-form-item
                label="手机号"
                :label-width="formLabelWidth"
                prop="phone"
              >
                <el-input
                  v-model="form2.phone"
                  autocomplete="off"
                  maxlength="11"
                ></el-input>
              </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
              <el-button @click="handleclose('info')">取 消</el-button>
              <el-button type="primary" @click="confirm2()">确 定</el-button>
            </div>
          </el-dialog>
        </div>
      </div>
    </el-card>
  </div>
</template>
<script>
import { mapGetters, mapState } from "vuex";
import axios from "axios";
export default {
  data() {
    return {
      userinfo: {
        table: "",
        sid: "",
        aid: "",
        name: "",
        gender: "",
        dor: "",
        phone: "",
        img: "",
      },
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      formLabelWidth: "120px",
      dialogImageUrl: "",
      dialogVisible: false,
      form: {
        prepass: "",
        newpass: "",
        confirmpass: "",
      },
      form2: {
        phone: "",
      },
      passwordrule: {
        prepass: [{ required: true, message: "请输入原密码", trigger: "blur" }],
        newpass: [{ required: true, message: "请输入新密码", trigger: "blur" }],
        confirmpass: [
          { required: true, message: "请输入确认密码", trigger: "blur" },
        ],
      },
      inforule: {
        phone: [
          { required: false },
          {
            pattern: /^[1]([3-9])[0-9]{9}$/,
            message: "请正确输入11位手机号码",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    handleclose(ref) {
      switch (ref) {
        case "pass":
          this.$refs.pass.resetFields();
          this.dialogFormVisible1 = false;
          break;
        case "info":
          this.$refs.info.resetFields();
          this.dialogFormVisible2 = false;
          break;
      }
    },
    handleRemove(file, fileList) {
      this.dialogImageUrl = "";
      console.log(this.dialogImageUrl);
    },
    handlePictureCardPreview(file, fileList) {
      this.dialogVisible = true;
    },
    successUpload(res, file) {
      alert("修改信息成功！");
      setTimeout(function () {
        location.reload();
      }, 1000);
    },
    beforeUpload(file) {
      this.dialogImageUrl = file.url;
      console.log(this.dialogImageUrl);
      const typeArr = ["image/png", "image/gif", "image/jpeg", "image/jpg"];
      const isJPG = typeArr.indexOf(file.raw.type) !== -1;
      const isLt3M = file.size / 1024 / 1024 < 3;
      if (!isJPG) {
        this.$message.error("只能是图片!");
        this.$refs.upload.clearFiles();
        this.files = null;
        return;
      }
      if (!isLt3M) {
        this.$message.error("上传图片大小不能超过 3MB!");
        this.$refs.upload.clearFiles();
        this.files = null;
        return;
      }
    },
    confirm() {
      this.$refs["pass"].validate((valid) => {
        if (valid) {
          if (this.form.prepass == this.password) {
            if (this.form.newpass == this.form.confirmpass) {
              axios
                .post("http://localhost:3000/api/changpass", {
                  password: this.form.newpass,
                  loginid: this.loginid,
                })
                .then((response) => {
                  console.log("原密码:" + this.form.prepass);
                  console.log("新密码:" + this.form.newpass);
                  console.log("确认密码:" + this.form.confirmpass);
                  alert("修改完成");
                  this.$store.commit("changpassword", this.form.newpass);
                  this.$refs.pass.resetFields();
                  this.dialogFormVisible1 = false;
                })
                .catch((error) => {
                  console.log("error:" + error);
                });
            } else {
              alert("两次密码不一样!");
            }
          } else {
            alert("原密码错误!");
          }
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    confirm2() {
      this.$refs["info"].validate((valid) => {
        if (valid) {
          if (this.form2.phone == "") {
            this.$refs.upload.submit();
            console.log("no phone");
          } else {
            this.userinfo.phone = this.form2.phone;
            if (this.dialogImageUrl == "") {
              console.log("no pic");
              axios
                .post("http://localhost:3000/api/phone", {
                  phone: this.form2.phone,
                  table: this.userinfo.table,
                  name: this.userinfo.name,
                })
                .then((response) => {
                  //console.log(this.userinfo)
                })
                .catch((error) => {
                  console.log("error:" + error);
                });
            } else {
              this.$refs.upload.submit();
              console.log("pic&phone");
            }
          }
          this.dialogFormVisible2 = false;
        } else {
          return false;
        }
      });
    },
  },
  computed: {
    ...mapState({
      role: (state) => state.role,
      loginid: (state) => state.loginid,
      password: (state) => state.password,
    }),
    ...mapGetters(["getrole", "getloginid", "getpassword"]),
  },
  created() {
    //学生进入
    if (this.role == "student") {
      axios
        .post("http://localhost:3000/api/stuinfo", { sid: this.loginid })
        .then((response) => {
          this.userinfo = response.data[0];
          this.userinfo.table = "student";
          //console.log(this.userinfo)
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    }
    //管理员进入
    else if (this.role == "admin") {
      axios
        .post("http://localhost:3000/api/admininfo", { aid: this.loginid })
        .then((response) => {
          this.userinfo = response.data[0];
          this.userinfo.table = "admin";
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    }
  },
};
</script>
<style scoped>
.users {
  margin-top: 20px;
  margin-left: 60px;
  min-height: 80vh;
}
.avatar {
  width: 146px;
  height: 146px;
  display: block;
}
</style>