-- Jan's complete program
-- User ID: 90dd34ab-6804-4afa-8724-264bc3523bba

do $$
declare
  uid uuid := '90dd34ab-6804-4afa-8724-264bc3523bba';
  p1 uuid; p2 uuid; p3 uuid; p4 uuid; p5 uuid;
begin

-- Delete existing programs for this user (clean start)
delete from public.exercises where program_id in (select id from public.programs where user_id = uid);
delete from public.programs where user_id = uid;

-- Montag: Pull
insert into public.programs (user_id,day_key,label,full_label,color,sort_order)
  values (uid,'monday','Mo – Pull','Montag · Pull · Calisthenics','#e8c547',0) returning id into p1;
insert into public.exercises (program_id,name,sets,type,sort_order) values
  (p1,'Front Lever Holds (Ringe)',5,'time',0),
  (p1,'Tuck FL Pullups (Ringe)',4,'reps',1),
  (p1,'Negative Muscle-ups',4,'reps',2),
  (p1,'Muscle-ups (Schwung)',4,'reps',3),
  (p1,'Chest to Bar Pull-ups',5,'reps',4),
  (p1,'Weighted Pull-ups',5,'weighted',5),
  (p1,'Pull-ups',3,'reps',6);

-- Dienstag: Kraft
insert into public.programs (user_id,day_key,label,full_label,color,sort_order)
  values (uid,'tuesday','Di – Kraft','Dienstag · Kraft','#e87c47',1) returning id into p2;
insert into public.exercises (program_id,name,sets,type,sort_order) values
  (p2,'Kettlebell Swings',10,'weighted',0),
  (p2,'Squats (Langhantel)',5,'weighted',1),
  (p2,'Deadlifts (Langhantel)',4,'weighted',2),
  (p2,'Shoulder Press (LH)',4,'weighted',3),
  (p2,'Hip Thrusts',3,'weighted',4),
  (p2,'High Rows',5,'weighted',5),
  (p2,'Bench Press (LH)',5,'weighted',6),
  (p2,'Bizeps Curls',5,'weighted',7);

-- Mittwoch: Push
insert into public.programs (user_id,day_key,label,full_label,color,sort_order)
  values (uid,'wednesday','Mi – Push','Mittwoch · Push · Calisthenics','#47e8c5',2) returning id into p3;
insert into public.exercises (program_id,name,sets,type,sort_order) values
  (p3,'Wall HS Scapula Pushups',3,'reps',0),
  (p3,'Freier Handstand',5,'time',1),
  (p3,'Ring Dream Machine Planche',5,'time',2),
  (p3,'Ring Pushups',4,'reps',3),
  (p3,'Dips (Ringe)',4,'reps',4),
  (p3,'Handstand Pushups',4,'reps',5),
  (p3,'Pike Pushups',3,'reps',6);

-- Donnerstag: Kraft
insert into public.programs (user_id,day_key,label,full_label,color,sort_order)
  values (uid,'thursday','Do – Kraft','Donnerstag · Kraft','#a047e8',3) returning id into p4;
insert into public.exercises (program_id,name,sets,type,sort_order) values
  (p4,'Kettlebell Swings',10,'weighted',0),
  (p4,'Squats (Langhantel)',5,'weighted',1),
  (p4,'Romanian Deadlifts',4,'weighted',2),
  (p4,'Lunges',3,'weighted',3),
  (p4,'Leg Curl (Maschine)',4,'weighted',4),
  (p4,'Calf Raises',4,'weighted',5),
  (p4,'Ab Wheel',3,'reps',6),
  (p4,'Hanging Leg Raises',3,'reps',7);

-- Freitag: Pull
insert into public.programs (user_id,day_key,label,full_label,color,sort_order)
  values (uid,'friday','Fr – Pull','Freitag · Pull · Calisthenics','#47a0e8',4) returning id into p5;
insert into public.exercises (program_id,name,sets,type,sort_order) values
  (p5,'Front Lever Holds (Ringe)',5,'time',0),
  (p5,'Tuck FL Rows',4,'reps',1),
  (p5,'Archer Pull-ups',4,'reps',2),
  (p5,'L-Sit Pull-ups',4,'reps',3),
  (p5,'Ring Rows',4,'reps',4),
  (p5,'Weighted Pull-ups',5,'weighted',5),
  (p5,'Pull-ups',3,'reps',6);

end $$;
