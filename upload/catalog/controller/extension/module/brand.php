<?php
class ControllerExtensionModuleBrand extends Controller {
	public function index() {
		$this->load->language('extension/module/brand');	
		$this->load->model('catalog/manufacturer');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['manufacturers'] = array();

		$manufacturers = $this->model_catalog_manufacturer->getManufacturers();

		foreach ($manufacturers as $result) {
			$data['manufacturers'][] = array(
				'name' => $result['name'],
				'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
			);
		}
		
		return $this->load->view('extension/module/brand', $data);
	}
}