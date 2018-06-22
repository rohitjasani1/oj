<?php 

class ModelReportSmshareSms extends Model {
    
    
    public function get_sms_beans($data){
        $sql = "SELECT `id`, `to`, `body`, `username`, `reference`, `comment`, `price`, `create_date`, `update_date` FROM `" . DB_PREFIX . "smsbean` WHERE `id` > 0 ";    //id > 0 just to allow easy concatenation below of the AND keyword.
        
        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(create_date) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }
        
        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(create_date) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }
        
        if (!empty($data['filter_username'])) {
            $sql .= " AND `username` like '" . $this->db->escape($data['filter_username']) . "'";
        }
        
        if (!empty($data['filter_reference'])) {
            $sql .= " AND `reference` like '%" . $this->db->escape($data['filter_reference']) . "%'";
        }
        
        if (!empty($data['filter_comment'])) {
            $sql .= " AND `comment` like '%" . $this->db->escape($data['filter_comment']) . "%'";
        }
        
        
        $sort_data = array(
            'id'
        );
        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY `" . $data['sort'] . "`";
        } else {
            $sql .= " ORDER BY `id`";
        }
        
        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }
        
        
        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }
        
            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }
        
            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }
        
        $query = $this->db->query($sql);
        
        return $query->rows;
    }
    
    public function get_total_sms_beans($data = array()) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "smsbean`");
    
        return $query->row['total'];
    }
    
}

?>