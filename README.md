
# Facebook

대중적인 SNS를 모방하여 만든 프로젝트 입니다.  
자신의 일상을 주변 사람들과 공유해 보세요!

## 목차
- **프로젝트 주제 선정**  
Facebook은 소중한 사람들의 근황과 제 일상을 공유할 수 있는 SNS로써   
예전 시간가는 줄 모르고 재밌게 SNS를 했던 기억이 떠올라 재미있게 개발할 수 있을 것 같아서  
저의 첫 개인프로젝트의 주제로 선정하였습니다.

- **개요**
  #### 프로젝트 진행 순서
      
      기획 / 일정표 제작 -> DB설계 -> URL/API설계 -> 기능 구현 -> 테스트 / 배포
   #### 개발 기간
   
      2022/11/03 ~ 2022/11/29
   #### 기술 스택
  
     <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
     <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
     <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
     <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
     <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
     <br>
     <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> 
     <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> 
     <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
     <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
     
- **프로젝트 기획**
  #### 기획서
  
     [카카오 오븐 기획서](https://ovenapp.io/project/9pgiWGxen9A2hDKGk8WaiIaQbHJt8JwX#IxbOg)
     <br>
     [DB / URL 설계](https://docs.google.com/spreadsheets/d/1tOvoTo4X4-1eNtocFoKUccMBCZS0_nHmrvhQAYCjbOc/edit#gid=0)


- **개발**
  #### 주요 기능
  
     - 게시물 등록 : 게시물을 업로드 하게 되면 타임라인에 보여집니다.
     - 게시물 수정/삭제 : 내 게시물에서 게시물을 수정/삭제 할 수 있습니다.
     - 댓글쓰기 : 타임라인 화면에서 실시간으로 댓글을 등록 또는 삭제 할 수 있습니다.
     - 좋아요 : 게시글에 대한 좋아요를 누를 수 있습니다. 
     
  #### 트러블 슈팅
  
    <details>
    <summary>이미지를 교체하지 않고 수정 할 때 에러 발생</summary>
    
    #### org.springframework.web.multipart.support.MissingServletRequestPartException 

    #### #문제상황 
    내 게시물 페이지에서 이미지를 교체하지 않고 수정 버튼을 클릭할 때 에러가 발생했습니다.
    
    #### #해결방법
    이미지를 교체하지 않고 수정을 하게 되면 에러가 발생하지 않았는데, 제가 DB에서 imagePath는 null이 가능하도록 설계하고  
    Controller에서는 imagePath를 필수 파라미터로 받아서 발생된 에러였습니다.  
    @RequestParam(value="file", required=false)MultipartFrile file 로 변경하니 정상적으로 작동하였습니다.
    </details>
    
    <details>
    <summary>이미지 경로 오류</summary>
    
    #### #java.sql.SQLIntegrityConstraintViolationException
    
    #### #문제상황
    이미지를 업로드 할 때 에러가 발생했습니다.
    
    #### #해결방법
    FileManagerService에서 이미지를 업로드할 때 저장되는 경로에 문제였습니다.  
    public static final String FILE_UPLOAD_PATH = "C:\\코딩\\백앤드\\spring\\Facebook\\images/";
    로 경로를 수정하니 해결되었습니다.
      
    </details>
    
    <details>
    <summary>타임라인에서 게시글을 클릭 할 때 에러 발생</summary>
    
    #### #org.apache.ibatis.binding.BindingException: Invalid bound statement (not found)
    
    #### #문제상황
    타임라인에서 한개의 게시글을 클릭하면 해당 게시글의 페이지로 이동해야하는데 그 과정에서 에러가 발생했습니다.
    
    #### #해결방법
    먼저 MyBatis 에러를 확인하고 postMapper.xml 와 연결되는 postDAO에 오타가 있는지 확인하였습니다.  
    그 결과 postMapper.xml 와 postDAO의 아이디값이 일치하지 않아 발생한 에러임을 확인하였습니다.  
    서로의 아이디 값을 일치하게 수정하니 해결되었습니다.


    </detail>
  
  #### 향후 추가 및 개선 계획
    - 내 정보 수정
    - 회원 탈퇴 
  #### 영상
  
    [![페이스북 프로젝트](http://img.youtube.com/vi/Wj6A61S0-ck/0.jpg)](https://www.youtube.com/watch?v=Wj6A61S0-ck) 
                                    
   

- **느낀 점**
  
   한달이란 시간 동안 그동안 배웠던 내용을 바탕으로  Facebook을 모방한 sns 프로젝트를 진행하였습니다.  
   혼자 설계부터 구현까지 완성해야 하는 걱정과 두려움이 앞섰습니다.  
   처음 걱정과는 다르게 하루에 충분한 시간을 갖고 차근차근 설계한 대로 진행한 결과  
   시간에 맞게 프로젝트를 완성할 수 있었습니다.
   
   혼자 프로젝트를 진행하다 보니 사용하고 싶었던 기술들을 적용하는데 있어 찾아보고 공부해야하는 어려움이 많았습니다.  
   하지만 하나하나 찾아내고 적용이 되었을 때 너무너무 기쁘고 뿌듯했습니다.
   
   프로젝트를 마치면서 힘들었단 생각보다 재미있었단 생각이 앞섰고 다음번엔 다른 기술들도 사용해서  
   더 완성도 있는 프로젝트를 만들어 봐야겠단 생각에 현재 instagram을 모방한 sns를 한번 더 만들면서  
   기존 프로젝트에서 사용하지 못했던 기술들을 적용시키고자 진행중에 있습니다.
   
   개발을 처음 시작했을 때의 저보다 지금의 제가 많이 성장했단 걸 느꼈고 나도 할 수 있다 라는 자신감을 얻게 된 프로젝트였습니다.
   
   
   

 
  

