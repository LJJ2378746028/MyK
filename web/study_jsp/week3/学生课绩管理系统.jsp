<%--
  Created by IntelliJ IDEA.
  User: ljj
  Date: 2024/9/19
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生课绩管理系统</title>
</head>
<style>
    .td1 {
        width: 200px;
        border: 1px solid black;

    }
    .td2 {
        width: 600px;
        text-align: left;
        border: 1px solid black;

    }
</style>

<body>
<h1 style="color: blue; text-align: center;">
    学生课绩管理系统
</h1>
<form action="注册成功.jsp" onsubmit="return validateForm()">
    <table style="margin-left: auto; margin-right: auto; text-align: right; border: 2px solid black;">
        <tr>
            <td class="td1">
                用户选择
            </td>
            <td class="td2">
                <input type="radio" name="user">学生
                <input type="radio" name="user">教师
                <input type="radio" name="user">管理员
            </td>
        </tr>
        <tr>
            <td class="td1">
                用户名
            </td>
            <td class="td2">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td class="td1">
                密码
            </td>
            <td class="td2">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td class="td1">
                重新输入密码
            </td>
            <td class="td2">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td class="td1">
                出生日期
            </td>
            <td class="td2">
                <select name="dob">
                    <option value="">- 请选择 -</option>
                    <option value="2000">2000</option>
                    <option value="2001">2001</option>
                    <option value="2002">2002</option>
                    <option value="2003">2003</option>
                    <option value="2004">2004</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="td1">
                兴趣
            </td>
            <td class="td2">
                <input type="checkbox" name="hobby" value="music"> 音乐
                <input type="checkbox" name="hobby" value="anime"> 动漫
                <input type="checkbox" name="hobby" value="movie"> 电影
            </td>
        </tr>
        <tr style="height: 100px;">
            <td class="td1">
                我的简介
            </td>
            <td class="td2">
                <textarea name="my_profile" cols="40" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="td1" align="center">
                <input type="submit" value="注册">
                <input type="reset" value="取消">
            </td>
            <!-- <td></td> -->
        </tr>
    </table>
</form>

<script>
    function validateForm() {
        // 获取表单元素
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;

        // 验证用户名不能为空
        if (username === "") {
            alert("用户名不能为空！");
            return false;
        }

        // 验证密码不能为空且至少4位
        if (password === "") {
            alert("密码不能为空！");
            return false;
        } else if (password.length < 4) {
            alert("密码长度至少为4位！");
            return false;
        }

        // 验证两次输入的密码是否一致
        if (password !== repassword) {
            alert("两次输入的密码不一致！");
            return false;
        }

        // 如果所有验证都通过，则提交表单
        return true;
    }
</script>
</body>
</html>
