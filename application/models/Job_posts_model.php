<?php 
class Job_posts_model extends MY_Model {

    public function getActiveJobStatusCount() {
        $sql = "SELECT count(*) as count FROM `job_posts` where status ='Active'";
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0)
           {
            return $query->row()->count;
           }
           else {
             return NULL;
           }
    
      }

      public function getClosedJobStatusCount() {
        $sql = "SELECT count(*) as count FROM `job_posts` where status ='Closed'";
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0)
           {
            return $query->row()->count;
           }
           else {
             return NULL;
           }
    
      }


      public function getOnHoldJobStatusCount() {
        $sql = "SELECT count(*) as count FROM `job_posts` where status ='On-Hold'";
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0)
           {
            return $query->row()->count;
           }
           else {
             return NULL;
           }
    
      }

      public function getJobTrend() {
        $sql ='SELECT DATE_FORMAT(request_dates, "%M %y") as month_year, DATE_FORMAT(request_dates, "%y") AS y, DATE_FORMAT(request_dates, "%M") AS m, COUNT(DISTINCT id) as count
        FROM job_posts
        GROUP BY y,m 
        order by request_dates asc';
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0)
           {
            return $query->result_array();
           }
           else {
             return NULL;
           }
    
      }

      public function getOpenJobTrend() {
        $sql ='SELECT DATE_FORMAT(request_dates, "%M %y") as month_year, DATE_FORMAT(request_dates, "%y") AS y, DATE_FORMAT(request_dates, "%M") AS m, COUNT(DISTINCT id) as count
        FROM job_posts
        where status="Active"
        GROUP BY y,m 
        order by request_dates asc';
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0)
           {
            return $query->result_array();
           }
           else {
             return NULL;
           }
    
      }

}