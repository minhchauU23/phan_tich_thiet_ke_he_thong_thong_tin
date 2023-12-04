<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        *{
            margin: 0;
            box-sizing: border-box;
        }

        body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 100vh;
            font-size: 20px;  
            background: linear-gradient(to right, #00c4cc, #8b3dff);
       
           }

        .main-container{
            display: flex;
            margin: auto;
        }
        
        form{
            border: 1px black solid;
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            padding: 20px;
            background-color: white;
        }

        .input-container{
            display: flex;
            flex-direction: row;
            padding: 20px;
            justify-content: space-between;
        }

        .input-container>label{
            padding: 5px 15px 5px 10px;
        } 

        .btn{
            border: 0px;
            border-radius: 20px;
            padding: 10px;
            font-size: 20px;
            color: white;
            flex:1;
            margin: 0px 10px;
        }
        .login{
            background-color: yellowgreen;
        }
        .register{
            background-color: red;
        }
        .btn:hover{
            background-color: green;
            cursor: pointer;
        }
        .input-container>a{
            font-size: 10px;
            padding: 0px;
        } 
    

    </style>
</head>
<body>
    <div class = "main-container">
        <form method="post" action="doLogin.jsp">
            <div class = "input-container">
                <label for="">Username</label>
                <input type="text" class = "input-child" name = "username">
            </div>
            <div class = "input-container">
                <label for="">Password</label>
                <input type="password" class = "input-child" name = "password">
            </div>
            <div class="input-container">
                <input type="submit" value="Login" class = "btn login">
             
            </div>
            
        </form>
    </div>
</body>
</html>