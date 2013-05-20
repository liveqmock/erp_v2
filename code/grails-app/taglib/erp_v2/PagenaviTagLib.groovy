package erp_v2

class PagenaviTagLib {
	def pagenavi = { attrs, body ->

		def current = Integer.parseInt(params.p?:'1')
		def total = attrs.total as int
		if (total < 1 || current > total) return
		['max', 'offset', 'sort', 'order'].each {params.remove(it)}
		out << """
			<div class="wp-pagenavi">
				<span class="pages">共有<strong>${total}</strong>页数据, 当前第<strong>${current}</strong>页</span>
		"""

		if (current != 1) {
			params.p = current - 1
			out << """<a href="${createLink(params: params, action: actionName)}" class="prevpostslink">上一页</a>"""
		}

		if (total <= 5) {
			for (i in 1..total) {
				if (i == current) {
					out << """<span class="current">$i</span>"""
				} else {
					params.p = i
					out << """<a href="${createLink(params: params, action: actionName)}" class="page larger">$i</a>"""
				}
			}
		} else {
			def before = current
			def after  = before + 4
			def before_extend = true
			def after_extend = true

			if (current <= 5) {before = 1; before_extend = false; after = before + 4}
			else if (current > total - 5) {after = total; after_extend = false; before = total - 4}
			else {before = before - 2; after = after - 2}

			if (before_extend) {
				out << '<span class="extend">...</span>'
			}

			for (i in before..after) {
				if (i == current) {
					out << """<span class="current">$i</span>"""
				} else {
					params.p = i
					out << """<a href="${createLink(params: params, action: actionName)}" class="page larger">$i</a>"""
				}
			}

			if (after_extend) {
				out << '<span class="extend">...</span>'
			}

		}

		if (current < total) {
			params.p = current + 1
			out << """<a href="${createLink(params: params, action: actionName)}" class="nextpostslink">下一页</a>"""
		}

		if (current == total) {
			if (total > 1) {
				out << """<span class="page_end">尾页</span>"""
			}
		} else {
			params.p = total
			out << """<a href="${createLink(params: params, action: actionName)}" class="nextpostslink">尾页</a>"""
		}

		out << '</div>'
	}
}
