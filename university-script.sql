USE `db_university`;

#ESERCIZI CON SELECT
#Seleziono tutti gli studenti nati nel 1990
SELECT COUNT(`id`) AS `Studenti_nati_dopo_1990`
FROM `students`
WHERE year(`date_of_birth`) = 1990;

#Seleziono tutti i corsi con cfu superiori a 10
SELECT COUNT(`id`) AS `Corsi_con_cfu_sopra_10`
FROM `courses`
WHERE `cfu` > 10;

#Seleziono tutti gli studenti che hanno più di 30 anni
SELECT count(id) AS `Studenti_over_30`
FROM `students`
WHERE `date_of_birth` < date_sub(curdate(), interval 30 year);

#Seleziono tutti i corsi del primo semestre del primo anno di qualsiasi corso
SELECT COUNT(`id`) AS `Numero_corsi`, `period`, `year`
FROM `courses`
WHERE `period` = "I semestre"
AND `year` = 1;

#Seleziono tutti gli appelli che avvengono nel pomeriggio del 20/06/2020
SELECT COUNT(*) AS `Appelli_pomeridiani_del_20/06/2020`
FROM exams
WHERE `date` = '2020-06-20'
AND `hour` >= '14:00:00';

#Seleziono tutti i corsi di laurea magistrale
SELECT COUNT(*) AS `Corsi_laurea_magistrale`
FROM `degrees`
WHERE `name` LIKE '%Laurea Magistrale%';

#Da quanti dipartimenti è composta l'università?
SELECT COUNT(*) AS `Numero_totale_dipartimenti`
FROM `departments`;

#Quanti sono gli insegnanti che non hanno un numero di telefono?
SELECT COUNT(*) AS `Insegnanti_senza_numero_cellulare`
FROM `teachers`
WHERE `phone` is null;

#ESERCIZI CON GROUP BY
#Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `Iscritti_per_anno`, year(`enrolment_date`)
FROM students 
GROUP BY year(`enrolment_date`);

#Contare gli insegnanti con l'ufficio nello stesso edificio
SELECT COUNT(*) AS `Insegnanti_con_ufficio_nello_stesso_edificio`, `office_address`
FROM `teachers`
GROUP BY `office_address`;

#Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) AS `Media_voto_per_appello`, `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

#Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`id`) AS `Corsi_per_dipartimento`, `department_id`
FROM degrees
GROUP BY `department_id`;