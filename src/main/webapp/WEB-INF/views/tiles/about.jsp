<%--
  Created by IntelliJ IDEA.
  User: culpan
  Date: 24.05.2020
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="c-wrapper">

    <H2>
        КАФЕ
    </H2>

    <div>
        <p><strong>Предметная область - кафе</strong>
        <p><strong>Сущности:</strong>
        <ul>
            <li>Корзина - корзина для продуктов</li>
            <li>Продукты/блюда - имеют категории</li>
            <li>Заказ - создается из продуктов находящихся в корзине, для создания заказа необходимо заполнить дополнительные данные о адресе в USER</li>
            <li>Пользователь - есть несколько типов пользователей USER, ADMIN</li>
        </ul>
        <p><strong>Кратко о функциях: </strong>
        <ul>
            <li>Вы можете добавлять продукты и блюда в корзину</li>
            <li>Создайте заказ из продуктов которые лежат в корзине</li>
            <li>Для начала вам придется войти в профиль, можете воспользоваться админкой Логин: admin Пароль: admin</li>
            <li>В админке можно добавлять/изменять новые продукты категории и пользователей, также просматривать совершенные пользователями заказы</li>
            <li>При авторизации может возникнуть ошибка, просто вернитесь на главную страницу и обновите ее, это происходит из за назначения типов пользователя</li>
            <li>Если хотите изменить существующий продукт нужно, зайти в меню кафе и открыть доп окно продукта</li>
        </ul>
        <p><strong>Классы:</strong>
        <p>Описание корзины<br>
        public class Cart implements Serializable { <br>

        private static final long serialVersionUID = 6963354675862881135L;<br>

        private String cartId;<br>
        private Map<Integer, Item> products;<br>
        private BigDecimal totalValue;<br>

        public Cart() {<br>
        this.products = new HashMap<Integer, Item>();<br>
        this.totalValue = new BigDecimal(0);<br>
        }

        public Cart(String cartId) {<br>
        this();<br>
        this.cartId = cartId;<br>
        }<br>


        public class Item implements Serializable {<br>


        private static final long serialVersionUID = 1503029612197381427L;<br>
        private Product product;<br>
        private Integer quantity;<br>
        private BigDecimal totalValue;<br>


        public Item(){<br>
        this.quantity = 1;<br>
        }<br>

        public Item(Product product){<br>
        this.quantity = 1;<br>
        this.product = product;<br>
        }

        public Item(Product product, Integer quantity){<br>
        this.quantity = quantity;<br>
        this.product = product;<br>
        }

        <p>Описание продуктов/блюд<br>
        @Entity<br>
        @Table(name = "PRODUCT")<br>
        public class Product implements Serializable{<br>

        private static final long serialVersionUID = -6461657159577643747L;<br>
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)<br>
        private int id;<br>

        @Size(min = 4, max = 40, message = "{Size.Product.productName.validation}")<br>
        @Column(name = "PRODUCT_NAME")<br>
        private String productName;<br>

        @Min(value = 0,    message = "{Min.Product.productPrice.validation}")<br>
        @Digits(integer = 8,fraction = 2,message = "{Digits.Product.productPrice.validation}")<br>
        @NotNull(message = "{NotNull.Product.productPrice.validation}")<br>
        @Column(name = "PRODUCT_PRICE")<br>
        private BigDecimal productPrice;<br>

        @NotBlank(message = "{NotBlank.Product.productDescription.validation}")<br>
        @Column(name = "PRODUCT_DESCRIPTION")<br>
        private String productDescription;<br>

        @JsonIgnore<br>
        @NotNull(message = "NotNull.Product.category.validation")<br>
        @ManyToOne(cascade = CascadeType.MERGE)<br>
        private Category category;<br>

        <p>Описание категорий<br>
        @Entity<br>
        @Table(name = "CATEGORY")<br>
        public class Category implements Serializable {<br>

        private static final long serialVersionUID = 7728135118671324990L;<br>

        @Id<br>
        @GeneratedValue(strategy = GenerationType.IDENTITY)<br>
        private int id;

        @Size(min = 4, max = 40, message = "{Size.Category.categoryName.validation}")<br>
        @NotEmpty(message = "NotEmpty.Category.categoryName.validation")<br>
        @Column(name = "CATEGORY_NAME", length = 15, unique = true, nullable = false)<br>
        
        private String categoryName;<br>
        <p>Описание заказов<br>

        @Entity<br>
        @Table(name = "ORDERS")<br>
        public class Order implements Serializable {<br>

        private static final long serialVersionUID = -167040897500768764L;<br>

        @Id<br>
        @GeneratedValue(strategy = GenerationType.IDENTITY)<br>
        private int id;<br>

        @Transient<br>
        private Cart cart;<br>

        @Valid<br>
        @ManyToOne(cascade = CascadeType.MERGE)<br>
        private User user;<br>


        @ManyToMany(fetch = FetchType.EAGER)<br>
        @JoinTable(name = "ORDER_PRODUCT",<br>
        joinColumns = {@JoinColumn(name = "ORDER_ID")},<br>
        inverseJoinColumns = {@JoinColumn(name = "PRODUCT_ID")})<br>
        private List<Product> productList = new ArrayList<Product>();<br>

        <p>Описание пользователя<br>

        @Entity<br>
        @Table(name = "APP_USER")<br>
        public class User implements Serializable<br>
        {<br>

        private static final long serialVersionUID = 4256810895227136750L;<br>

        @Id<br>
        @GeneratedValue(strategy = GenerationType.IDENTITY)<br>
        private int id;<br>

        @UserSsoId(groups = ValidateOnCreationOnly.class)<br>
        @Size(min = 3, max = 15, message = "{Size.User.ssoId.validation}")<br>
        @Column(name = "SSO_ID", unique = true, nullable = false)<br>
        private String ssoId;<br>
        @Email<br>
        @Column(name = "EMAIL", nullable = false)<br>
        private String email;<br>

        @Column(name = "PASSWORD", nullable = false)<br>
        private String password;<br>
        @Column(name = "PHONE_NUMBER", nullable = false, length = 15)<br>
        private String phoneNumber;<br>
        @Size(min = 3, max = 15, message = "{Size.User.firstName.validation}")<br>
        @Column(name = "FIRST_NAME", nullable = false)<br>
        private String firstName;<br>
        @Size(min = 3, max = 15, message = "{Size.User.lastName.validation}")<br>
        @Column(name = "LAST_NAME", nullable = false)<br>
        private String lastName;<br>


        @NotEmpty<br>
        @Column(name = "STATE", nullable = false)<br>
        private String state = State.ACTIVE.getState();<br>

        @ManyToMany(fetch = FetchType.EAGER)<br>
        @JoinTable(name = "APP_USER_USER_PROFILE",<br>
        joinColumns = {@JoinColumn(name = "USER_ID")},<br>
        inverseJoinColumns = {@JoinColumn(name = "USER_PROFILE_ID")})<br>
        private Set<UserProfile> userProfiles = new HashSet<UserProfile>();<br>


            @Size(min = 3, max = 50, message = "{Size.User.streetName.validation}")<br>
            @Column(name = "STREET_NAME", length = 50)<br>
            private String streetName;<br>
            @Min(value = 1, message = "{Min.User.doorNo.validation}")<br>
            @Column(name = "DOOR_NO")<br>
            private String doorNo;<br>
            @Size(min = 3, max = 20, message = "{Size.User.areaName.validation}")<br>
            @Column(name = "AREA_NAME", length = 20)<br>
            private String areaName;<br>
            @Size(min = 3, max = 50, message = "{Size.User.state.validation}")<br>
            @Column(name = "STATE_NAME", length = 50)<br>
            private String stateName;<br>
            @Size(min = 3, max = 25, message = "{Size.User.country.validation}")<br>
            @Column(name = "COUNTRY", length = 25)<br>
            private String country;<br>
            @Size(min = 2, max = 10, message = "{Size.User.zipCode.validation}")<br>
            @Column(name = "ZIP_CODE", length = 10)<br>
            private String zipCode;<br>

        <p>Описание типов пользователя<br>

        @Entity<br>
        @Table(name="USER_PROFILE")<br>
        public class UserProfile implements Serializable {<br>


        private static final long serialVersionUID = -2715555743979245933L;<br>
        @Id @GeneratedValue(strategy=GenerationType.IDENTITY)<br>
        private int id;<br>

        @Column(name="TYPE", length=15, unique=true, nullable=false)<br>
        private String type = UserProfileType.USER.getUserProfileType();<br>
        
        
        <p><strong>Структура БД:</strong><br>
        CREATE TABLE public.app_user (<br>
        id integer NOT NULL,<br>
        sso_id character varying(30) NOT NULL,<br>
        password character varying(100) NOT NULL,<br>
        first_name character varying(30) NOT NULL,<br>
        last_name character varying(30) NOT NULL,<br>
        email character varying(30) NOT NULL,<br>
        state character varying(30) NOT NULL,<br>
        door_no character varying(20) DEFAULT NULL::character varying,<br>
        area_name character varying(20) DEFAULT NULL::character varying,<br>
        state_name character varying(50) DEFAULT NULL::character varying,<br>
        country character varying(25) DEFAULT NULL::character varying,<br>
        zip_code character varying(15) DEFAULT NULL::character varying,<br>
        phone_number character varying(15) DEFAULT NULL::character varying,<br>
        street_name character varying(50) DEFAULT NULL::character varying<br>
        );<br>

        CREATE TABLE public.app_user_user_profile (<br>
        user_id integer NOT NULL,<br>
        user_profile_id integer NOT NULL<br>
        );<br>

        CREATE TABLE public.category (<br>
        id integer NOT NULL,<br>
        category_name character varying(40) NOT NULL<br>
        );<br>

        CREATE TABLE public.order_product (<br>
        order_id integer NOT NULL,<br>
        product_id integer NOT NULL<br>
        );<br>

        CREATE TABLE public.orders (<br>
        id integer NOT NULL,<br>
        user_id integer<br>
        );<br>

        CREATE TABLE public.product (<br>
        id integer NOT NULL,<br>
        product_description character varying(255) NOT NULL,<br>
        product_name character varying(40),<br>
        product_price numeric(10,2) NOT NULL,<br>
        category_id integer NOT NULL,<br>
        CONSTRAINT product_product_price_check CHECK ((product_price >= (0)::numeric))<br>
        );<br>

        CREATE TABLE public.user_profile (<br>
        id integer NOT NULL,<br>
        type character varying(15) NOT NULL<br>
        );<br>
        
        <img src="../../../resources/img/database.jpg" alt="image" style="width:70%; height:70%">

    </div>

</body>
</html>
