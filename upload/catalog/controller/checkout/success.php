<?php
class ControllerCheckoutSuccess extends Controller {
	const VOUCHER_THEME_ID = 8;
	const VOUCHER_STATUS_ENABLED = 1;
	const VOUCHER_CODE_CHARS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

	public function index() {
		$this->load->language('checkout/success');

		if (isset($this->session->data['order_id'])) {
			$this->cart->clear();

			if ($this->customer->isLogged())
			{
				$this->load->model('sale/voucher');

				do
				{
					$voucherCode = '';

					for ($i = 0; $i < 8; $i++)
					{
						$voucherCode .= self::VOUCHER_CODE_CHARS[mt_rand(0, 61)];
					}

					$voucherCodeExists = $this->model_sale_voucher->getVoucherByCode($voucherCode);
				} while (!empty($voucherCodeExists));

				$voucher_data = array(
					'code'             => $voucherCode,
					'from_name'        => $this->config->get('config_name'),
					'from_email'       => $this->config->get('config_email'),
					'to_name'          => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
					'to_email'         => $this->customer->getEmail(),
					'voucher_theme_id' => self::VOUCHER_THEME_ID,
					'message'          => $this->language->get('text_voucher_message'),
					'amount'           => rand(15, 35),
					'status'           => self::VOUCHER_STATUS_ENABLED
				);

				$voucher_id = $this->model_sale_voucher->addVoucher($voucher_data);
				$this->model_sale_voucher->sendVoucher($voucher_id);
			}

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				if ($this->customer->isLogged()) {
					$activity_data = array(
						'customer_id' => $this->customer->getId(),
						'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
						'order_id'    => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_account', $activity_data);
				} else {
					$activity_data = array(
						'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
						'order_id' => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_guest', $activity_data);
				}
			}

			$orderId = $this->session->data['order_id'];

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
		}

		$this->document->setTitle($this->language->get('heading_title'));
		
		$data['isLoggedCheckout'] = $this->customer->isLogged() ? true : false;

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf(
				$this->language->get('text_customer'),
				(!empty($orderId) ? $this->url->link('account/order/info&order_id=', '', true) . $orderId : ''),
				(!empty($orderId) ? sprintf($this->language->get('text_order'), $orderId) : ''),
				$this->url->link('account/account', '', true),
				$this->url->link('account/order', '', true), 
				$this->url->link('account/download', '', true), 
				$this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_create_account'] = $this->language->get('text_button_create_account');

		$data['continue'] = $this->url->link('common/home');
		$data['create_account'] = $this->url->link('account/register');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}
}