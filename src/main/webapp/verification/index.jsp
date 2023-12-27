<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>OTP Verification</title>
</head>
<body>
<div class="otp-card">
    <h1>OTP Verification</h1>

    <%
        String email = (String) session.getAttribute("email");
        if(email!=null){ %>
        <p >Code has been send to <span style="color: #7fad39"><%= email %></span> </p>
    <%
//            session.removeAttribute("email");
        }
    %>




    <%
        String msg = (String) session.getAttribute("msg");
        if(msg!=null){ %>
    <p style="font-family:Cairo, sans-serif ; color: red;"><%= msg %></p>
    <%
            session.removeAttribute("msg");
        }
    %>
    <div class="otp-card-inputs">
        <input type="text" max length="1" autofocus id="numb1">
        <input type="text" max length="1" id="numb2">
        <input type="text" max length="1" id="numb3">
        <input type="text" max length="1" id="numb4">
        <input type="text" max length="1" id="numb5">
    </div>
    <p>Didn't get the OTP? <a href="#"> Resend</a></p>
    <button onclick="sendCode()" >Verify</button>
</div>
<script src="script.js"></script>
<script>
    function sendCode(){
        const number1 = document.getElementById("numb1").value;
        const number2 = document.getElementById("numb2").value;
        const number3 = document.getElementById("numb3").value;
        const number4 = document.getElementById("numb4").value;
        const number5 = document.getElementById("numb5").value;
        const verifcationCode = ""+number1+number2+number3+number4+number5;


        location.href="../codeverify?authcode="+verifcationCode;
    }
</script>
</body>
</html>