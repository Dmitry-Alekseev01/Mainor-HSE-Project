select ei.name_patient, ei.birth_date
from doctor_visit_info as dvi
join ekp_info as ei on dvi.ekp_ID = ei.ekp_ID
WHERE dvi.date_visit BETWEEN '2026-03-10 09:10:00+03' AND '2026-03-13 13:10:00+03';