package edu.poly.shop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import edu.poly.shop.domain.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long>{
	@Query("select o from OrderDetail o where o.order.orderId = ?1")
	Page<OrderDetail> findByOrderId(Long orderId,Pageable pageable);
}
