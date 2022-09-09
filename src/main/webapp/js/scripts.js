$(function (){
    const id = $("input[name='id']").val().trim();
    loadMyService(id);
   
})

function loadMyService(user_id) {
    $.ajax({
        url: conPath + "/myservice/list?id=" + user_id,
        type: "GET",
        cache: false,
        success: function(data, status) {
            if (status == "success") {
                // 서버측 에러 메시지 있는 경우
                if (data.status != "OK") {
                    alert(data.status);
                    return;
                }
                buildMyService(data); // 댓글 목록 렌더링
            }
        },
    });
}


function buildMyService(result) {

    const out = [];

    result.data.forEach(myService => {
        let id = myService.id;
        let title = myService.title.trim();
        let content = myService.content.trim();
        let regdate = myService.regdate;

        let user_id = parseInt(myService.user.id);
        let username = myService.user.username;
        let name = myService.user.name;
        
        let answerCnt = parseInt(myService.cmtCheck);
        
        if(answerCnt >=1){
			var answer = "답변완료";
			} else {
				var answer = "미완료";
		}
		


        const row = `
	        <tr>
	        <td>${name}</td>
	        <td>
	            <a href=../service/detail?id=${id}>${title}</a>            
	        </td>
	        <td>${answer}</td>	/* 답변완료기능 xml 에서 */
	        <td>${regdate}</td>
	        <tr>
	        `;
        out.push(row);
    });
    $("#myService_list").html(out.join("\n"));
}
