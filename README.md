# Yongmin's Community

first Board Project

- 🙎🏻‍♂️**사용자**

    *먼저, 페이지를 이용하는 사용자는 회원과 비회원으로 구분한다.*

    - **비회원**은 게시글을 열람할 수는 있으나, **게시글** **작성, 삭제, 수정**에 관해서는 접근할 수 없다. 만약 비회원이 글 작성 페이지를 요청하면 Controller 동작 이전에 Interceptor preHandler가 실행되어 로그인 페이지로 Redirect시킨다.
     비회원은 식별을 위한 서비스 이용이 가능하고, 가입과 로그인을 거친 비회원은 **회원**이 된다.
    - **회원**은 게시글 CRUD 기능을 이용할 수 있다. 하지만 모든 게시글을 제어하는 것은 아니며, 오직 자신이 올린 게시물만 수정, 삭제가 가능하다. 또한 회원은 Board에서 확장된 기능을 수행하는 myPage를 통해 자신의 정보를 직관적으로 알 수 있다.
- 📑**Board**
    - **Read** : 회원들이 작성한 게시물을 읽을 수 있다. 페이징을 통해  보기 쉽고 정리된 게시물 리스트를 제공하고 제목 클릭 시 게시물의 상세 페이지로 이동한다.
    ※ **Hit** : 게시물 열람 시 조회수를 증가시킨다.
    - **Write** : 회원들만 이용 가능한 기능으로 제목과 전달하고자 하는 내용을 업로드하여 타인에게 제공할 수 있다.
    - **Update** : 작성자가 오직 자신의 게시물에서 접근할 수 있고, 게시글을 수정할 수 있다.
    - **Delete** : 게시글 삭제의 기능을 수행하며, 이 역시 작성자 본인만 접근한다.
    - **Search :** 검색 타입을 제목과 작성자로 구분하여 리스트에서 게시물 검색 기능을 수행한다.

- ⚙**myPage**
    - **Information** : Session에 저장된 회원 개인의 정보(아이디, 이름, 이메일, 가입날짜)를 확인할 수 있다.
    - **Board(Extended)** : 회원 본인이 올린 게시물을 관리할 수 있고, 기존 게시판에서 확장된 기능인 일괄 삭제를 이용할 수 있다.
