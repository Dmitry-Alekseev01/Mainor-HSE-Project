select ei.name_patient, ei.birth_date
from hospitalization_info as hi
join ekp_info as ei on hi.ekp_ID = ei.ekp_ID
where hi.hospital_ID = 1