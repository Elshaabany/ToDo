<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>To-Do List</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
	<div class="container mt-5">
		<h2 class="mb-4">To-Do List</h2>

		<form id="editForm" action="<%= request.getContextPath() %>/"
			method="post">
			<input type="hidden" name="action" value="edit"> <input
				type="hidden" id="editIndex" name="editIndex" value=""> <input
				type="hidden" id="updatedTask" name="updatedTask" value="">
		</form>

		<form id="deleteForm" action="<%= request.getContextPath() %>/"
			method="post">
			<input type="hidden" name="action" value="delete"> <input
				type="hidden" id="deleteIndex" name="deleteIndex" value="">
		</form>

		<form id="addForm" action="<%= request.getContextPath() %>/"
			method="post" class="mt-3">
			<input type="hidden" name="action" value="add">
			<div class="input-group">
				<input type="text" name="newTask" class="form-control"
					placeholder="New Task" required autofocus>
				<button type="submit" class="btn btn-primary">Add Task</button>
			</div>
		</form>

		<ul class="list-group" style="margin-top: 20px;">
			<% 
                @SuppressWarnings("unchecked")
                List<String> toDoList = (List<String>) request.getAttribute("toDoList");
                if (toDoList != null) {
                    for (int i = 0; i < toDoList.size(); i++) { 
                        String task = toDoList.get(i);
            %>
			<li
				class="list-group-item d-flex justify-content-between align-items-center">
				<%= task %>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-warning"
						onclick="editTask(<%= i %>, '<%= task %>')">Edit</button>
					<button type="button" class="btn btn-danger"
						onclick="deleteTask(<%= i %>)">Delete</button>
				</div>
			</li>
			<% 
                    } 
                } 
            %>
		</ul>
	</div>


	<script>
        function editTask(index, task) {
            var updatedTask = prompt("Edit Task:", task);
            if (updatedTask !== null) {
                document.getElementById("editIndex").value = index;
                document.getElementById("updatedTask").value = updatedTask;
                document.getElementById("editForm").submit();
            }
        }

        function deleteTask(index) {
            if (confirm("Are you sure you want to delete this task?")) {
                document.getElementById("deleteIndex").value = index;
                document.getElementById("deleteForm").submit();
            }
        }
    </script>
</body>
</html>
