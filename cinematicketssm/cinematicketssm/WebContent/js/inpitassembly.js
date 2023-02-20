// * =====================================================================
// * �������inpit_assembly
// * ���ߣ�cababgelol
// * ����֧�֣�cababgelol.net/inpit-assembly/2.0/
// * =====================================================================
(function(w) {
    var inpit_assembly = function(ele, opt) {
        this.$ele = ele,
        this.defaults = {
        	selected	  : "active",							   // Ĭ�ϼǺ�
			selected_data:[],
			ischeck_	  : true, 							       // �Ƿ�����������ֵ��ʼ����ѡ������
			ischeck_class : false,//
			max:function(e,max){},
			min:function(e,min){}
		},
		this.options = $.extend({}, this.defaults, opt);
    };
    inpit_assembly.prototype = {
        fun: function() {
			var $this  		   = this,
				$fun		   = this.options,
				$check_ 	   = this.$ele,
				$check_formname= "formname",
				$check_class   = (function(val){
					var val = $fun.selected;
					if(val == undefined){
						val = "active"
					}
					return val;
				})(),
				$check_index   = 0;
				
			$fun.selected =	this.options.selected;
			$fun.selected_data = this.options.selected_data;
			$fun.ischeck_ = this.options.ischeck_;
			$fun.ischeck_class = this.options.ischeck_class;
			
		 	//��ʼ
			$check_.find("div[radio],div[checkbox]").each(function(){
				var this_ = $(this);
					this_.attr("index",$check_index);		
					
				// * ===============
				// * radio - ��ѡ
				// * ��ʼֵ
				// * ================			

				if(this_.attr("radio") != undefined){
					if($fun.ischeck_ && this_.attr("min") != undefined){
						//����min
						var obj = $check_.find(" > div[index]").eq($check_index);
						if($fun.ischeck_class  && $(this).find("div[name]").eq(i).hasClass('ack')){
							for(var i = 0 ; i < $(this).find("div[name]").length ; i++){	
								for(var i = 0 ; i < this_.attr("min") ; i++){
									
									// * ===============
									// * ischeck_class
									// * ischeck_class���������ڱ�ǩ���Ѿ��������calss="ack"Ĭ��ֵ��min="2"����£��رճ�ʼֵ�����ֹ����Ĭ��ѡ��Ӧ����D/F�������Ǳ��A/B/D/F
									// * ������ischeck_��ischeck_classͬʱtrue�����ֶ����ʼֵ
									// * 1.������Ĭ��ѡ���inpit/assembly��Ⱦ֮ǰ��������ischeck_= true��ischeck_class = false
									// * 2.����û��Ĭ��ѡ�����ischeck_= false��ischeck_class = true
									// * ================
									
									obj.find("> div").eq(i).addClass($check_class)
								}
							}
						}
						else if($fun.ischeck_class == false){
							for(var i = 0 ; i < this_.attr("min") ; i++){
								obj.find("> div").eq(i).addClass($check_class)
							}
						}
					}
				}
		
				// * ===============
				// * checkbox - ��ѡ
				// * ��ʼֵ
				// * ================		
				
				if(this_.attr("checkbox") != undefined){
					obj = $check_.find(" > div[index]").eq($check_index);
					obj.find("> div").eq(0).addClass($check_class);
				}
				
				// * ===============
				// * selected�ĳ�ʼֵ
				// * ================					
				
				var obj_selected_data = $fun.selected_data[0];
				if(obj_selected_data != undefined){
					let obj;
					for(let i = 0 ; i < $fun.selected_data.length ; i++){
						for(let x = 0 ; x < $fun.selected_data[i].data.length ; x++){
							if(typeof obj_selected_data.data == "object"){
								obj = $("[formname=" + $fun.selected_data[i].name + "] [name][value=" + $fun.selected_data[i].data[x] + "]");
							}
							if(typeof obj_selected_data.data == "string"){
								obj = $("[formname=" + $fun.selected_data[i].name + "] [name][value]");
							}
							obj.addClass($check_class);
						}
					}					
				}
				
				
				
				++$check_index;
				
			});
			
		 	//��ѡ
			$check_.on("click","[checkbox] *[name][value]",function(event) {
				event.stopPropagation();
				var this_ = $(this),
				// * ===============
				// * ���������Ǹ����
				// * this_siblings = this_.siblings(),  
				// * ================
				this_obj = this_.attr("name"),
				this_ack = $check_.find(" *[name=" + this_obj + "]." + $check_class);

				if(this_.attr("disabled") != undefined ){ return }
				
				if( this_ack.length > 0){ 
					this_ack.removeClass($check_class) 
				}
				add_Class(this_,$check_class);	
			});
			
			
			
			//��ѡ
			$check_.on("click","[radio] *[name][value]",$fun.ischeck_ = function(event,t,max,min) {
				event.stopPropagation();
				var this_ = $(this),
					this_siblings = this_.siblings(),						
					this_obj = this_siblings.attr("name"),
					this_ack = $check_.find(" *[name=" + this_obj + "]." + $check_class);
					this_max = (function(){
						var max = this_.parent().attr("max");
						if(max == undefined)
							max = this_.parents().find("div[name]").length + 1;
						return max;
					})();
					this_min = this_.parent().attr("min");
					
				if( this_.hasClass($check_class) ) {
					//����
					removeClass(this_,$check_class);
					if( this_ack.length == this_min ){
						add_Class(this_,$check_class);
						$fun.min($check_,this_min);						
					}
				}else{
					//���
					if( this_max != undefined ){
						if(this_ack.length <= this_max){
							add_Class(this_,$check_class);
							if(this_ack.length == this_max){
								removeClass(this_,$check_class);
								$fun.max($check_,this_max);						
							}
						}	
					}
				}
				
				return [this_,this_max,this_min];
			});
			
			// * ================
			// * ɾ���Ǻ�
			// * ================
			
			function removeClass(e,selected){
				if( e.attr("class").length <= selected.length )
					e.removeAttr("class")
				else 
					e.removeClass(selected)
			}
			
			// * ================
			// * ��ӼǺ�
			// * ================			
			
			function add_Class(e,selected){
				if(e.attr("disabled") == undefined){
					e.addClass(selected);
				}
			}			
			
			// * ===============
			// * ȡtype='inpit/assembly'��ѡ��ֵ
			// * val�������
			// * ================			
			
			+(w.check_result =  function (obj){
				var val	= [];
				if(obj != undefined){
					$("[" + $check_formname + "=" + (function(){
						if(typeof obj == "string"){
							return obj;
						}
						if(typeof obj == "object"){
							return obj.parents("[formname]").attr($check_formname);
						}
							
					})() + "] [index]").each(function(){
						
						// * ===============
						// * checkbox - ��ѡ
						// * ================				
												
						if( $(this).is("[checkbox]") ){	
							val.push( $(this).find(" *." + $check_class).attr("value") );
						}
						
						// * ===============
						// * radio - ��ѡ
						// * ================						
						
						if( $(this).is("[radio]") ){
							$(this).find("*." + $check_class).each(function(){
								val.push(
									$(this).attr("value") //context.attributes.value.value
								);
							})
						}	
					});			
				}else{
					console.log("��check_result����$(this)")
				}
				
				// * ===============
				// * ɸѡ�ظ�
				// * ===============
				
			    Array.prototype.del = function() {   
			        var a = {}, c = [], l = this.length;   
			        for (var i = 0; i < l; i++) {   
			            var b = this[i];   
			            var d = (typeof b) + b;   
			            if (a[d] === undefined) {   
			                c.push(b);   
			                a[d] = 1;   
			            }   
			        }   
			        return c;   
			    }   
				return [{"data":val.del()},{"parameter":$fun},{"obj":$check_}]
			});
        }
    };
    $.fn.inpitassembly = function(options) {
        var drag = new inpit_assembly(this,options);
	        drag.fun();
			return this;
    };
})(window);