select ei.name_patient, ei.birth_date
from doctor_visit_info as dvi
join ekp_info as ei on dvi.ekp_ID = ei.ekp_ID
where hospital_ID = 1