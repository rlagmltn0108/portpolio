<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>JQuery-validation demo | Bootstrap</title>

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    />

    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.11.3.min.js"
    ></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
          <div class="page-header">
            <div class="alert alert-info" role="alert">
              <h4>
                This demo shows how to integrate JQuery-validation and the
                Bootstrap framework.
              </h4>
              <ul>
                <li>
                  <a href="http://getbootstrap.com/" class="alert-link"
                    >Bootstrap home project</a
                  >.
                </li>
              </ul>
            </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Simple Form</h3>
            </div>
            <div class="panel-body">
              <form
                id="signupForm"
                method="post"
                class="form-horizontal"
                action="/user/join"
              >
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="user_name">이름</label>
                  <div class="col-sm-5">
                    <input
                      type="text"
                      class="form-control"
                      id="user_name"
                      name="user_name"
                      placeholder="이름 입력"
                    />
                  </div>
                  <span>필수</span>
                </div>

                <div class="form-group">
                  <label class="col-sm-4 control-label" for="user_id">아이디</label>
                  <div class="col-sm-5">
                    <input
                      type="text"
                      class="form-control"
                      id="user_id"
                      name="user_id"
                      placeholder="아이디 입력"
                    />
                  </div>
                    <span>필수</span>
                    <input type="button" value="중복 체크"  id="check"/>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pwd"
                    >비밀번호</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="password"
                      class="form-control"
                      id="pwd"
                      name="pwd"
                      placeholder="임호 입력"
                    />
                  </div>
                  <span>필수</span>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pwd2"
                    >비밀번호 확인</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="password"
                      class="form-control"
                      id="pwd2"
                      name="pwd2"
                      placeholder="확인 비밀번호 입력"
                    />
                  </div>
                  <span>필수</span>
                </div>

                <div class="form-group">
                  <label class="col-sm-4 control-label" for="email"
                    >이메일</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="text"
                      class="form-control"
                      id="email"
                      name="email"
                      placeholder="이메일 입력"
                    />
                  </div>
                  <span>필수</span>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="phone"
                    >전화번호
                  </label>
                  <div class="col-sm-5">
                    <input
                      type="tel"
                      class="form-control"
                      id="phone"
                      name="phone"
                      placeholder="핸드폰 번호 입력"
                    />
                  </div>
                  <span>필수</span>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="addr"
                    >집 주소</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="tel"
                      class="form-control"
                      id="addr"
                      name="addr"
                      placeholder="집 주소 입력"
                    />
                  </div>
                  <span>선택</span>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="addr2"
                    >상세 주소</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="tel"
                      class="form-control"
                      id="addr2"
                      name="addr2"
                      placeholder="상세  주소 입력"
                    />
                  </div>
                  <span>선택</span>
                </div>
                <div class="form-group">
                  <div class="col-sm-9 col-sm-offset-4">
                    <button
                      type="submit"
                      class="btn btn-primary"
                      value="회원가입"
                    >
                      회원가입
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      $.validator.setDefaults({
        submitHandler: function () {
          // alert("submitted!");
          $("button").submit();
        },
      });

      $(document).ready(function () {
    	  $("#check").click(function(){
    		   checkId()
			  var result = $('#user_id').val()
			  console.log('result:',result)
    		  if(result==" "){
    			  console.log("사랑")
    		  }
  	    })
        $("#signupForm").validate({
          rules: {
            name: "required",
            user_id: "required",
            address:"required",
            moreaddress:"required",
            hnum:"required",
            pnum:"required",
            pwd: {
              required: true,
              minlength: 4,
            },
            pwd2: {
              required: true,
              minlength: 4,
              equalTo: "#pwd",
            },
            email: {
              required: true,
              email: true,
            },
          },
          messages: {
            name: "이름을 입력해주세요",
            user_id: "아이디를 입력해주세요 ",
            pwd: {
              required: "비밀 번호를 입력하세요 ",
              minlength: "적어도 4글자 입력하세요 ",
            },
            pwd2: {
              required: "비밀 번호를 입력하세요 ",
              minlength: "적어도 4글자 입력하세요 ",
              equalTo: "비밀번호가 일지하지 않습니다",
            },
            email: "유효한 이메일을 입력하세요 ",
          },
          errorElement: "em",
          errorPlacement: function (error, element) {
            // Add the `help-block` class to the error element
            error.addClass("help-block");
          },
          highlight: function (element, errorClass, validClass) {
            $(element)
              .parents(".col-sm-5")
              .addClass("has-error")
              .removeClass("has-success");
          },
          unhighlight: function (element, errorClass, validClass) {
            $(element)
              .parents(".col-sm-5")
              .addClass("has-success")
              .removeClass("has-error");
          },
        });
      });
    </script>
    <script>
      function checkId(){
        var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'/user/idCheck?user_id='+id, //Controller에서 요청 받을 주소
            type:'get', //POST 방식으로 전달
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            	console.log(cnt)
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    alert("사용가능한 아이디 입니다");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    alert("아이디를 다시 입력해주세요");
                    $('#user_id').val('');
                    //$('#id').val(id)
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };
    </script>
  </body>
</html>
