let page = 0;
let out = [];

$(function () {
    const id = $("input[name='id']").val().trim();
    loadMyReserveList(id);
})

function loadMyReserveList(movie_id){
	if (page == 0) out = [];
    const data = {
        "page": page,
    };
    $.ajax({
        url: conPath + "/myreserve/detail?id=" + movie_id,
        type: "GET",
        data: data,
        cache: false,
        success: function (data, status) {
            if (status == "success") {
                // 서버측 에러 메시지 있는 경우
                if (data.status != "OK") {
                    alert(data.status + "왜 안될까용!");
                    return;
                }
                page;
                buildMyReserveList(data); // 댓글 목록 렌더링
            }
        },
    });
}

function loadNextMyReserveList(movie_id) {
    const data = {
        "page": page += 1,
    };


    $("#myReserveBySeat").html;
    $.ajax({
        url: conPath + "/myreserve/detail?id=" + movie_id,
        type: "GET",
        data: data,
        cache: false,
        success: function (data, status) {
            if (status == "success") {
                // 서버측 에러 메시지 있는 경우
                if (data.status != "OK") {
                    alert(data.status);
                    return;
                }
                if (data.count == 0) {
                    alert("마지막페이지에오!");
                    page -= 1;
                } else {

                    buildMyReserveList(data); // 서비스목록

                }
            }
        },
    });
}

function loadPreviousMyReserveList(movie_id) {
    if (page == 0) out = [];
    const data = {
        "page": page -= 1,
    };

    if (page < 0) {
        alert("첫번째 페이지입니다");
        page = 0;
    } else {
        $("#myReserveBySeat").html;
        $.ajax({
            url: conPath + "/myreserve/list?id=" + movie_id,
            type: "GET",
            data: data,
            cache: false,
            success: function (data, status) {
                if (status == "success") {
                    // 서버측 에러 메시지 있는 경우
                    if (data.status != "OK") {
                        alert(data.status);
                        return;
                    }
                    buildMyReserveList(data);

                }
            },
        });
    }
}



function buildMyReserveList(result){
	const out = [];
	
	result.data.forEach(myReserve => {
		var id = myReserve.id;
		var seat = myReserve.seat;
		var regdate = myReserve.regdate;
		
	const row =  `
	        <tr>
	        <td><span><strong>${id}}</strong></span></td>
	        <td>
	            <a href="resdetail?id=${id}"><span><pre style="font-family:sans-serif; word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;">내 좌석: ${seat}</pre></span></a>            
	        </td>
	        <td><span><small class="text-secondary">${regdate}</small></span></td>
	        </tr>`;
        ;
        out.push(row);
    });
    $("#myReserveBySeat").html(out.join("\n"));
    $("#page").text(page+1 + "page");
}


