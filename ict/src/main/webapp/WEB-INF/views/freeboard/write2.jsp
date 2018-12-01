<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Latest compiled and minified JavaScript -->
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
var num=1;

$(document).ready(function() {
   getToday();


    $("#Departamento").change(function(){
       DepartamentoSelect();
    });
    
    $("#Provincia").change(function(){
       ProvinciaSelect();
   });
    
    function DepartamentoSelect(){
      var departmento=$("#Departamento option:selected").val();
        $('#Provincia, #Distrito').find('option').each(function() {
             $(this).remove();
         });
        $.ajax({
            type:"POST",
            url:encodeURI("<c:url value='/proteccion/select.do?code="+departmento+"&codeId=COM09'/>"),
            dataType:"json",
            success:function(data){
                $('#Provincia').append("<option selected='selected'>===select===</option>");
                $('#Distrito').append("<option>===select===</option>");
               for(var i=0;i<data.length;i++){
                  $('#Provincia').append("<option value="+data[i].code+">"+data[i].codeNm+"</option>");
               }
            }
        });
    }
    
    function ProvinciaSelect(){
       var provincia=$("#Provincia option:selected").val();
        $('#Distrito').find('option').each(function() {
             $(this).remove();
             
         });
        $.ajax({
            type:"POST",
            url:encodeURI("<c:url value='/proteccion/select.do?code="+provincia+"&codeId=COM10'/>"),
            dataType:"json",
            success:function(data){
               $('#Distrito').append("<option>===select===</option>");
               for(var i=0;i<data.length;i++){
                  $('#Distrito').append("<option value="+data[i].code+">"+data[i].codeNm+"</option>");
               }

            }
        });
    }


});



function validate(event) {
    event.preventDefault();
    grecaptcha.execute();
  }


  function FormSubmit() {
     validate;
      if (grecaptcha.getResponse() == ""){
          alert("리캡챠를 체크해야 합니다.");
          return false;
      } else {
         var form = document.getElementById("form");
            form.submit();
          return true;
      }
   }

function getToday(){
   var date = new Date();
   var year = date.getFullYear();
   var month = new String(date.getMonth()+1);
   var day = new String(date.getDate());

   // 한자리수일 경우 0을 채워준다.
   if(month.length == 1){
     month = "0" + month;
   }
   if(day.length == 1){
     day = "0" + day;
   }

   $("#today").text(day + "/" + month + "/" + year);
   $('input[name=createDate]').attr('value',day + "/" + month + "/" + year);
}

function fileselect(event,num){

   var filename=event.value.replace(/C:\\fakepath\\/i, '');
   $("#span"+num).remove();
   $("#li"+num).append("<span id='span"+num+"'>"+filename+""+
         "<button class='img_del' onclick='fileDel("+num+")'>x</button>"+
         "<button class='img_add' onclick='fileAdd()' type='button'>추가</button></span>");
if(event.files.length==0){
      $("#span"+num).remove();
   }
}
function fileAdd(){

   $("#fileul").append("<li id='li"+num+"'>"+
         "<div class='filebox dp_in vm mgr10'>"+
         "<label for='ex_filename"+num+"' class='ac btn_search'>Search</label>"+
         "<input type='file' id='ex_filename"+num+"' name='file"+num+"' class='upload_hidden' onchange='fileselect(this,"+num+")'>"+
         "</div>"+
         "</li>");
   num++;
}



function fileDel(num){
   console.log(num);
   //첫번째 파일일 경우 파일첨부하는 라벨과 input 박스가 날아가면 안되므로.
   if(num==0){
      $("#span"+num).remove();
      $("#filelabel"+num).prepend("<input type='file' id='ex_filename"+num+"' name='file"+num+"' class='upload_hidden' onchange='fileselect(this,"+num+")'>");
      
   }else if(num!=0){
      $("#li"+num).remove();
      }
}
function firstFileSelect(event,num){
   var filename=event.value.replace(/C:\\fakepath\\/i, '');
   $("#span"+num).remove();
   $("#li"+num).append("<span id='span"+num+"'>"+filename+""+
   "<button class='img_del' id='delbutton' onclick='fileDel("+num+")'>x</button>"+
   "<button class='img_add' id='addbutton' onclick='fileAdd()' type='button'>추가</button></span>");
   if(event.files.length==0){
      $("#span"+num).remove();
   }
}



</script>

      <div class="container">
         <div class="contents">
            <div class="ct_box">
               <div class="page_tit">
                  <h2>Aviso de existencia de Patrimonio Cultural</h2>
               </div>

               <div class="board_info_shadow">
                  Recibimos notificación de preservación de propiedad cultural.<br />
                  El formulario de solicitud completado se enviará a los departamentos pertinentes y se procesará.
               </div>

               <div class="board_tit mgt30">
                  <h2>DATOS DEL COLABORADOR</h2>
                  <p class="r_unit f_16 f_bold"><span class="fill">*</span> obligatorio</p>
               </div>
               <form action="<c:url value='/proteccion/cultureinsert.do'/>" method="POST" id="form" enctype="multipart/form-data">
               <table class="board_view_tp03">
                  <caption></caption>
                  <colgroup>
                     <col style="width:250px" />
                     <col style="width:*" />
                  </colgroup>
                   <tbody>

                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">Nombres y Apellidos</label></th>
                        <td>
                           <input id="userNm" type="text" name="createNm" class="comm_input input_s wide" title="" />
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">DNI N°</label></th>
                        <td>
                           <input id="declUserDni" type="text" name="dniNo" class="comm_input input_s wide" title="" />
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">Teléfono de contacto</label></th>
                        <td>
                           <input id="telNo" type="text" name="telNo" class="comm_input input_s wide" title="" />
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">Correo electrónico de contacto</label></th>
                        <td>
                           <input id="email" type="text" name="email" class="comm_input input_s wide" title="" />
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><label for="">Cargo o representación</label></th>
                        <td>
                           <input id="position" type="text" name="position" class="comm_input input_s wide" title="" />
                        </td>
                       </tr>

                   </tbody>
               </table>

               <div class="board_tit mgt40">
                  <h2>DATOS DE IDENTIFICACIÓN</h2>
               </div>
               <table class="board_view_tp03">
                  <caption></caption>
                  <colgroup>
                     <col style="width:250px" />
                     <col style="width:*" />
                  </colgroup>
                   <tbody>

                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">Fecha</label></th>
                        <td><span id="today"></span><input type="hidden" id="createDt" name="createDt"></td>
                       </tr>
                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">Tipo de patrimonio</label></th>
                        <td>
                           <input type="radio" name="tpCultHrtgCd" value="MVB" id="Mueble" checked="checked"/> <label for="Mueble">Patrimonio Mueble </label>
                           <input type="radio" name="tpCultHrtgCd" class="mgl40" value="HVB" id="Historico"/> <label for="Historico">Patrimonio Inmueble Histórico </label>
                           <input type="radio" name="tpCultHrtgCd" class="mgl40" value="Prehispani" id="Prehispanico"/> <label for="Prehispanico">Patrimonio Inmueble Prehispánico</label>
                           <p class="mgt10 f_blue">Seleccione el tipo de Patrimonio Cultural.</p>
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">Ubicación</label></th>
                        <td>
                           <div class="split_3x form_list form_inner">
                              <ul>
                                 <li>
                                    <label for="">Departamento</label>
                                    <select id="Departamento" name="Departamento" class="comm_select input_s wide mgt5">
                                          <option>seleccionar</option>
                                          <c:forEach var="depart" items="${depart}" >
                                          <option value="${depart.code }">${depart.codeNm }</option>
                                          </c:forEach>
                                    </select>
                                 </li>
                                 <li>
                                    <label for="">Provincia</label>
                                    <select id="Provincia" name="Provincia" class="comm_select input_s wide mgt5">
                                    <option>seleccionar</option>
                                    </select>
                                 </li>
                                 <li>
                                    <label for="">Distrito</label>
                                    <select id="Distrito" name="loc1Cd" class="comm_select input_s wide mgt5">
                                    <option>seleccionar</option>
                                    </select>
                                 </li>
                              </ul>
                           </div>
                           <p class="mgt10 f_blue">Seleccione la ubicación de su Patrimonio.</p>
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><label for="">Vía / nombre / número</label></th>
                        <td>
                           <div class="split_3x form_list form_inner">
                              <ul>
                                 <li>
                                    <label for="">Vía</label>
                                    <select id="Via" name="Via" class="comm_select input_s wide mgt5">
                                          <c:forEach var="via" items="${via}" >
                                          <option value="${via.code }">${via.codeNm }</option>
                                          </c:forEach>
                                    </select>
                                 </li>
                                 <li>
                                    <label for="Nombre" class="dp_in mgb5">nombre</label>
                                    <input id="Nombre" type="text" name="Nombre" class="comm_input input_s wide" title="" />
                                 </li>
                                 <li>
                                    <label for="Numero" class="dp_in mgb5">número</label>
                                    <input id="Numero" type="text" name="Numero" class="comm_input input_s wide" title="" />
                                 </li>
                              </ul>
                           </div>
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><label for="">Referencia de ubicación</label></th>
                        <td>
                           <div class="split_2x form_list form_inner">
                              <ul>
                                 <li>
                                    <label for="" class="dp_in mgb5 mgr10">Coordenada X</label>
                                    <input id="refCoorX" type="text" name="refCoorX" class="comm_input input_s" title="" style="width:329px;" />
                                 </li>
                                 <li>
                                    <label for="" class="dp_in mgb5 mgr10 mgl10">Coordenada Y</label>
                                    <input id="refCoorY" type="text" name="refCoorY" class="comm_input input_s" title="" style="width:329px;" />
                                 </li>
                              </ul>
                           </div>
                           <p class="mgt10 f_blue">Digite la referencia de la dirección escrita en la parte superior.</p>
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><label for="">Coordenadas de referencia</label></th>
                        <td>
                           <input id="refLoc" type="text" name="refLoc" class="comm_input input_s wide" title="" />
                           <p class="mgt10 f_blue">En caso de tener coordenadas de la ubicación, indíquelas.</p>
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">Breve descripción</label></th>
                        <td>
                           <textarea id="content" name="content" rows="" cols=""  class="comm_input wide input_s" style="height:80px;"></textarea>
                           <p class="mgt10 f_blue">Escriba una breve descripción de su Patrimonio</p>
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><label for="">Imagenes</label></th>
                        <td>
                           <div class="img_upload_list">
                              <ul id="fileul">
                                 <li id="li0">
                                    <div class="filebox dp_in vm mgr10">
                                       <label id="filelabel" for="ex_filename0" class="ac btn_search">Search</label>
                                        <input type="file" id="ex_filename0" id="file" name="file0" class="upload-hidden" onchange="firstFileSelect(this,0)">
                                     </div>
                                 </li>
                              </ul>
                           </div>
                        </td>
                       </tr>
                       <tr>
                        <th scope="row"><span class="fill">*</span><label for="">Código Captcha</label></th>
                        <td>
                           <div class="capture_wrap" id="recaptcha">
                           <div class="g-recaptcha" data-sitekey="6Lf5y2oUAAAAAKD4pmlD2NjXfAgDFIbGxctd0Q9e"></div>
                           </div>
                        </td>
                       </tr>

                   </tbody>
               </table>
               </form>

               <div class="board_btn">
                  <div class="split_3x">
                     <a href="#" id="submit" name="submit" class="btn btn_orange btn_shadow mgr15" onclick="FormSubmit()">ACEPTAR</a>
                     <a href="<c:url value='/proteccion/culturelist.do'/>" class="btn btn_shadow">ELIMINAR</a>
                  </div>
               </div>

            </div>
         </div>
      </div>
