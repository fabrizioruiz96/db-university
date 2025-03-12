# Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select st.*, deg.name
from students as st
join degrees as deg on st.degree_id = deg.id
where deg.name = "Corso di Laurea in Economia";

#Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select deg.*, dep.name
from degrees as deg
join departments as dep on deg.department_id = dep.id
where deg.name like "%Laurea Magistrale%"
and dep.name = "Dipartimento di Neuroscienze";

# Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
select crs.*, tcr.*
from courses as crs
join course_teacher as ct on ct.course_id = crs.id
join teachers as tcr on tcr.id = ct.teacher_id
where tcr.id = 44;

# Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
	# sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select st.*, deg.*, dep.name
from students as st
join degrees as deg on st.degree_id = deg.id
join departments as dep on deg.department_id = dep.id
order by st.surname, st.name;

# Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
select deg.*, crs.*, tcr.*
from degrees as deg
join courses as crs on crs.degree_id = deg.id
join course_teacher as ct on crs.id = ct.course_id
join teachers as tcr on ct.teacher_id = tcr.id;

# Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
select distinct tcr.*, dep.name
from teachers as tcr
join course_teacher as ct on tcr.id = ct.teacher_id
join courses as crs on ct.course_id = crs.id
join degrees as deg on crs.degree_id = deg.id
join departments as dep on deg.department_id = dep.id
where dep.name = "Dipartimento di Matematica";

# BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
	# per ogni esame, stampando anche il voto massimo. Successivamente,
	# filtrare i tentativi con voto minimo 18.
select count(exam_id), student_id, max(vote)
from exam_student
group by student_id;

select count(exam_id), student_id, max(vote)
from exam_student
where vote >= 18
group by student_id;