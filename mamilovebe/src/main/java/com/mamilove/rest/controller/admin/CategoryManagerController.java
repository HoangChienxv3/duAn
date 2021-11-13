package com.mamilove.rest.controller.admin;

import java.io.IOException;
import java.util.*;

import com.mamilove.request.dto.CategoryRequest;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Category;
import com.mamilove.entity.Categorydetail;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.CategoryService;

@CrossOrigin("http://localhost:4200/")
@RestController
@RequestMapping("/Manager/CategoryManagerController")
public class CategoryManagerController {
	@Autowired
	private ObjectMapper objectMapper;

	@Autowired
	private CategoryService categoryService;

	@PostMapping(value = "/create")
	public ResponseEntity<?> createCategory(@RequestBody Categorydetail  categoryRequest){
		try {
			Category category =  objectMapper.convertValue(categoryRequest,Category.class);
			return  ResponseEntity.ok(new Res( categoryService.saveAll((List<Category>) category),"Thêm thành công",true));

		}catch (Exception e){
			return ResponseEntity.ok(new Res("Thêm không thành công",false));
		}
	}

	@GetMapping(value = "findAll")
	public ResponseEntity<?>getAllListCategory(){
		try {
			return ResponseEntity.ok(new Res(categoryService.getAllListCategory(),"Danh sách categoy",true));
		}catch (Exception e){
			return ResponseEntity.ok(new Res("Loi",false));
		}
	}

    @GetMapping(value = "findById/{id}")
    public ResponseEntity<?>getIdCategory(@PathVariable("id") Long id){
		try{
			return ResponseEntity.ok(new Res(categoryService.listCategoryById(id),"Sản Phẩm tìm kiếm",true));
		}catch (Exception e){
			return ResponseEntity.ok(new Res("Không thấy sản phẩm,Sản phẩm không tồn tại",false));
		}
	}
	@PutMapping(value = "/update/{id}")
	public ResponseEntity<?> update (@PathVariable("id") Long id, @RequestBody CategoryRequest categoryRequest){
		Optional<Category> category = categoryService.findById(id);
		if(category.get().getIsDelete() == true){
			return ResponseEntity.ok(new Res("Sản phẩm không tồn tại",false));
		}
		Category ct = objectMapper.convertValue(category,Category.class);
		ct.setId(id);
		Category cate  = categoryService.save(ct);
		return  ResponseEntity.ok(new Res(cate,"Cập nhật thành công",true));
	}
	@PutMapping(value = "delete/{id}")
	public ResponseEntity<Res> delete(@PathVariable("id") Long id, Category category){
	     category = categoryService.findById(id).orElseThrow(
				 () -> {
					 throw new RuntimeException("Danh mục không tồn tại");
				 });
				 if(category != null){
					 category.setIsDelete(true);
		}
				 return  ResponseEntity.ok(new Res(categoryService.save(category),"Xóa thành công",true));

	}
//	@PostMapping("/deleteInBatch")
//	public ResponseEntity<?> deleteInBatch(@RequestBody String category){
//		try {
//			ObjectMapper json = new ObjectMapper();
//			List<Category> entity = new ArrayList<>();
//			entity = Arrays.asList(json.readValue(category, Category[].class));
//			categoryService.deleteInBatch(entity);
//			return ResponseEntity.ok(new Res("Save success",true));
//		} catch (Exception e) {
//			// TODO: handle exception
//			return ResponseEntity.ok(new Res("Save failed",false));
//		}
//	}
//	@PostMapping("/updateInline")
//	public ResponseEntity<?> updateInline(String createdItems,
//	        @RequestParam(required = false,value ="updatedItems") String updatedItems,
//	        @RequestParam(required = false,value ="deletedItems") String deletedItems) throws IOException{
//		try {
//			ObjectMapper json = new ObjectMapper();
//			List<Category> created = new ArrayList<>();
//			List<Category> updated = new ArrayList<>();
//			List<Category> deleted = new ArrayList<>();
//
//			created = Arrays.asList(json.readValue(createdItems,Category[].class));
//			updated = Arrays.asList(json.readValue(updatedItems,Category[].class));
//			deleted = Arrays.asList(json.readValue(deletedItems,Category[].class));
//
//			if(created.size() > 0) {
//				categoryService.saveAll(created);
//			}
//			if(updated.size() > 0) {
//				categoryService.saveAll(updated);
//			}
//			if(deleted.size() > 0) {
//				categoryService.deleteInBatch(deleted);
//			}
//			return ResponseEntity.ok(new Res(categoryService.findAll(),"Save success",true));
//		} catch (Exception e) {
//			// TODO: handle exception
//			return ResponseEntity.ok(new Res("Save failed",false));
//		}
//	}
}
