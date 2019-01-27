<template>
  <div class="reg-input-row">
    <label>验证码</label>
    <input type="text" @focus="focusReg" @blur="blurReg" v-model="isReg" :placeholder="dateinit">
    <canvas id="c3" width="120" height="40" @click="yzReg"></canvas>
  </div>
</template>
<script>
import { Toast } from "mint-ui";
export default {
  data() {
    return {
      sum: "",
      isReg: "",
      dateinit: "请输入验证码"
    };
  },
  methods: {
    blurReg() {
      this.dateinit = "请输入验证码";
    },
    focusReg() {
      this.dateinit = "看不清？换一张";
    },
    yzReg() {
      this.isCode();
    },
    // 四位数随机验证码
    isCode() {
      this.sum = "";
      let c3 = document.getElementById("c3");
      let ctx = c3.getContext("2d");
      //1.创建矩形120*30 背景颜色随机
      ctx.fillStyle = rc(180, 230);
      ctx.fillRect(0, 0, 120, 140);
      //2.创建随机字符串4绘制矩形中
      let pool =
        "QWERTYUIOPASDFGHJKLZXCVBNM1234567890zxcvbnmasdfghjklqwertyuiop";
      for (var i = 0; i < 4; i++) {
        let c = pool[rn(0, pool.length)];
        ctx.textBaseline = "top";
        let fs = rn(15, 30);
        ctx.font = fs + "px SimHei";
        ctx.fillStyle = rc(30, 180);
        ctx.fillText(c, 30 * i + 6, 5);
        this.sum += c;
      }
      //3:创建5条干扰线
      for (var i = 0; i < 5; i++) {
        ctx.beginPath();
        ctx.strokeStyle = rc(0, 230);
        ctx.moveTo(rn(0, 120), rn(0, 30));
        ctx.lineTo(rn(0, 120), rn(0, 30));
        ctx.stroke();
      }
      //4:创建50个干扰点
      for (var i = 0; i < 50; i++) {
        ctx.fillStyle = rc(0, 255);
        ctx.beginPath();
        ctx.arc(rn(0, 120), rn(0, 30), 1, 0, 2 * Math.PI);
        ctx.fill();
      }
      function rn(min, max) {
        let n = Math.random() * (max - min) + min;
        return Math.floor(n);
      }
      function rc(min, max) {
        let r = rn(min, max);
        let g = rn(min, max);
        let b = rn(min, max);
        return `rgb(${r},${g},${b})`;
      }
    }
  }
};
</script>
<style>
.reg-input-row {
  display: flex;
  height: 40px;
  position: relative;
  clear: left;
  overflow: hidden;
}
.reg-input-row label {
  font-family: "Helvetica Neue", Helvetica, sans-serif;
  font-size: 16px;
  color: #444;
  line-height: 1.1;
  float: left;
  width: 25%;
  padding: 13px 0px 0px 15px;
}
.reg-input-row input {
  float: left;
  width: 40%;
  padding: 5px 0 0 5px;
  border: 0;
}
.reg-input-row #c3 {
  float: right;
  margin-top: 5px;
  margin-bottom: 0;
  width: 120px;
  height: 40px;
}
</style>