/**
 * 
 */
 
 
  $(function() {
        /** 더 보기 버튼에 대한 이벤트 정의 */
        $("#adminSC").click(function() {
            // 다음 페이지를 요청하기 위해 페이지 변수 1 증가
            nowPage++;
            
            // Restful API에 GET 방식 요청
            $.get("${pageContext.request.contextPath} /AdminCateCondiDatas", {
                "page": nowPage     // 페이지 번호는 GET 파라미터로 전송한다.
            }, function(json) {
                var source = $("#prof-list-tmpl").html();   // 템플릿 코드 가져오기
                var template = Handlebars.compile(source);  // 템플릿 코드 컴파일
                var result = template(json);    // 템플릿 컴파일 결과물에 json 전달
                $("#list").append(result);      // 최종 결과물을 #list 요소에 추가한다.
                
                // 현재 페이지 번호가 전체 페이지 수에 도달했다면 더 보기 버튼을 숨긴다.
                if (json.meta.totalPage <= nowPage) {
                    $("#btnMore").hide();
                }
            });
        });
    });