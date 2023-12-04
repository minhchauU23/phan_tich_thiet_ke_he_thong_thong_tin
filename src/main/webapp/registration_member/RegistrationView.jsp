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
            font-size: 18px;
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
            padding: 15px;
            justify-content: space-between;
        }

        .input-container>label{
            padding: 5px 5px;
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
    
        .register{
            background-color: yellowgreen;
        }
        .btn:hover{
            background-color: green;
            cursor: pointer;
        }
      
    

    </style>
</head>
<body>
    <div class = "main-container">
        <form method="post" action="doRegister.jsp">
            <div class = "input-container">
                <label for="">Username</label>
                <input type="text" class = "input-child" name="username" >
            </div>
            <div class = "input-container">
                <label for="">Password</label>
                <input type="password" class = "input-child" name="password">
            </div>
            <div class = "input-container">
                <label for="">Fullname</label>
                <input type="text" class = "input-child" name="fullName">
            </div>
            <div class = "input-container">
                <label for="">Birth day</label>
                <input type="date" class = "input-child" name="dob">
            </div>
            <div class = "input-container">
                <label for="">Gender</label>
                <input type="text" class = "input-child"  name="gender">
            </div>
            <div class = "input-container">
                <label for="">Email</label>
                <input type="text" class = "input-child" name="email">
            </div>
            <div class = "input-container">
                <label for="">Phone</label>
                <input type="number" class = "input-child" name="phone">
            </div>
            <div class = "input-container">
                <label for="">Address</label>
                <input type="text" class = "input-child" name="address">
            </div>
            <div class="input-container">
                <input type="submit" value="Register" class = "btn register">
            </div>
            
        </form>
    </div>
</body>
</html>